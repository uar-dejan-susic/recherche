class Prospect < ApplicationRecord
  before_create :generate_token

  belongs_to :option
  belongs_to :person

  scope :accepted, -> { where(opted_in: true) }
  scope :reckon, -> { where(checked_in: true) }

  def i_want!
    self.opted_in = true
    self.opted_in_date = DateTime.now
    self.save!
  end

  def i_tried!
    self.tried_to_opt_in = true
    self.save!
  end

  def i_might!
    self.checked_in = true
    self.checked_in_date = DateTime.now
    self.save!
  end

  def generate_token
    begin
      self.access_token = SecureRandom.hex(10)
    end while self.class.exists?(access_token: access_token)
  end
end