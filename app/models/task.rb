class Task < ApplicationRecord
  belongs_to :list
  validates_presence_of :body

  def self.by_body(order = :asc)
    order(body: order)
  end

  def self.by_priority(order = :asc)
    order(priority: order)
  end
end
