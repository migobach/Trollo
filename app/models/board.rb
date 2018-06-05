class Board < ApplicationRecord
  has_many :lists
  validates_presence_of :title, :priority 
  
  def self.by_title
    order(:title)
  end
  
  def self.by_priority(order = :asc)
    order(priority: order)
  end

  def self.by_first_name(order = :asc)
    order(first_name: order)
  end

  def self.by_last_name(order = :asc)
    order(last_name: order)
  end

  def self.by_color(order = :asc)
    order(color: order)
  end

end
