class Board < ApplicationRecord
  has_many :lists
  validates :title, presence: true 
  
  def self.by_title
    order(:title)
  end
  
  def self.by_priority(order = :asc)
    order(priority: order)
  end
end