class Course < ActiveRecord::Base
  validates :number, :presence => true
  validates :title, :presence => true
  validates :desc, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true
  validates :status, inclusion: {in: %w(active inactive), message: "%{value} is not a valid  value, only active/inactive"}

  has_and_belongs_to_many :users


  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    #add fucking instructor to this stupid thing
    where("title LIKE ? or number LIKE ? or  'desc' LIKE ? or status LIKE ?"  , "%#{query}%","%#{query}%","%#{query}%","%#{query}%" )
  end


end
