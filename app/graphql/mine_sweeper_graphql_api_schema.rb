# frozen_string_literal: true

class MineSweeperGraphqlApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Union and Interface Resolution
  def self.resolve_type(_abstract_type, _obj, _ctx)
    # TODO: Implement this function
    # to return the correct object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, query_ctx)
    # Here's a simple implementation which:
    # - joins the type name & object.id
    # - encodes it with base64:
    # GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  # Given a string UUID, find the object
  def self.object_from_id(id, query_ctx)
    # For example, to decode the UUIDs generated above:
    # type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    #
    # Then, based on `type_name` and `id`
    # find an object in your application
    # ...
  end

  rescue_from(ActiveRecord::RecordNotFound) do |_err, _obj, _args, _ctx, field|
    # Raise a graphql-friendly error with a custom message
    raise GraphQL::ExecutionError, "#{field.type.unwrap.graphql_name} not found"
  end
rescue ActiveRecord::RecordInvalid => e
  GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
      " #{e.record.errors.full_messages.join(', ')}")
rescue ActiveRecord::RecordInvalid => e
  GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
    " #{e.record.errors.full_messages.join(', ')}")
end
