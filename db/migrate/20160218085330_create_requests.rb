class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :status
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
