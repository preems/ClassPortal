# class Create < ActiveRecord::Migration
#   def self.up
#     create_table :users_courses, :id => false do |t|
#       t.references :user
#       t.references :course
#     end
#     #add_index :users_courses, [:used_id, :course_id]
#     #add_index :users_courses, :course_id
#   end
#
#   def self.down
#     drop_table :users_courses
#   end
# end

class Create < ActiveRecord::Migration
  def up
    # create_table :assemblies do |t|
    #   t.string :name
    #   t.timestamps null: false
    # end
    #
    # create_table :parts do |t|
    #   t.string :part_number
    #   t.timestamps null: false
    # end

    create_table :courses_users, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
    end
  end

  def down
    drop_table: courses_users
  end

end