class Option < ApplicationRecord
  has_and_belongs_to_many :people, as: :prospects
end
