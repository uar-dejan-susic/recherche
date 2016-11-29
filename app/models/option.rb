class Option < ApplicationRecord
  has_many :prospects
  has_many :people, through: :prospects

  def open_slots
    self.available_slots - prospects.accepted.count
  end

  def is_expired?
    return false if is_full?
    return self.expire_date.utc < DateTime.now.utc if self.expire_date?
    false
  end

  def is_full?
    open_slots == 0
  end

  def count_accepted
    prospects.accepted.count
  end

  def count_invited
    prospects.count
  end
end
