class AddNotificationToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :notifications, index: true, foreign_key: true
  end
end
