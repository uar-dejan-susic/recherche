class Option < ApplicationRecord
  has_many :prospects
  has_many :people, through: :prospects

  def open_slots
    self.available_slots - prospects.accepted.count
  end

  def is_expired?
    false
  end
end
