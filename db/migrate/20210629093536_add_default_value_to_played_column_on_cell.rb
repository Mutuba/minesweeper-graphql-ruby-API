class AddDefaultValueToPlayedColumnOnCell < ActiveRecord::Migration[6.1]
  def up
    change_column :cells, :played, :boolean, default: false
  end
  
  def down
    change_column :cells, :played, :boolean, default: nil
  end
end
