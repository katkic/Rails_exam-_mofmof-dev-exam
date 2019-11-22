class Apartment < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations,
                                reject_if: proc { |attributes|
                                  attributes[:route].blank? &&
                                  attributes[:name].blank? &&
                                  attributes[:walking_minutes].blank?
                                }
  validates :name, presence: true
  validates :rent, presence: true,
                    numericality: { only_integer: true, greater_than: 0, allow_blank: true }
  validates :address, presence: true
  validates :year, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: true }
  validates :remarks, presence: true
end
