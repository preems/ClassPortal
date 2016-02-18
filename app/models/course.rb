class Course < ActiveRecord::Base
  attr_accessor :title
  has_and_belongs_to_many :users



  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    #add fucking instructor to this stupid thing
    where("title like ? or number like ? or  desc like ? or status like ?"  , "%#{query}%","%#{query}%","%#{query}%","%#{query}%" )
  end
end
