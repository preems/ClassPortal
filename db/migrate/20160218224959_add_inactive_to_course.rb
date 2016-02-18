class AddInactiveToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :inactive, :integer
  end
end
