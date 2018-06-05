class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  validates_presence_of :title

  def self.by_title(order = :asc)
    order(title: order)
  end

  def self.by_priority(order = :asc)
    order(priority: order)
  end

end
