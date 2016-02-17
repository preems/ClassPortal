class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :number
      t.string :title
      t.string :desc
      t.date :startDate
      t.date :endDate
      t.string :status

      t.timestamps null: false
    end
  end
end
