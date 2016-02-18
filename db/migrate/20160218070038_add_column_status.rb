class AddColumnStatus < ActiveRecord::Migration
  def change
     remove_column :courses_users, :status, :string
     remove_column :courses_users, :grade, :string
  end
end
