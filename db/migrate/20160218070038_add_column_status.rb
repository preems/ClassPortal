class AddColumnStatus < ActiveRecord::Migration
  def change
     add_column :courses_users, :status, :string
     add_column :courses_users, :grade, :string
  end
end
