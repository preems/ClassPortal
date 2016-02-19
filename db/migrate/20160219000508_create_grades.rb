class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :grade

      t.timestamps null: false
    end
  end
end
