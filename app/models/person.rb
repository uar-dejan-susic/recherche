class Person < ApplicationRecord
  attr_accessor :access_token

  has_and_belongs_to_many :options, as: :possible_options

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_token
    begin
      self.access_token = SecureRandom.hex(10)
    end while self.class.exists?(access_token: access_token)
  end
end
