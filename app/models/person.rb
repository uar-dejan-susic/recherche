class Person < ApplicationRecord
  has_many :prospects
  has_many :options, through: :prospects

  def name
    "#{self.first_name} #{self.last_name}"
  end
end