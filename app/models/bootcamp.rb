class Bootcamp < ApplicationRecord
  belongs_to :user

  geocoded_by :university
  after_validation :geocode

  validates :name, presence: true, length: { minimum: 3 }
  validates :university, presence: true
  validates :description, presence: true
end
