class AddColumnStatus < ActiveRecord::Migration
  def change
     add_column :users, :status, :string
     add_column :users, :grade, :string
  end
end
