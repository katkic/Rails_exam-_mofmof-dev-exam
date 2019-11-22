class Station < ApplicationRecord
  belongs_to :apartment, optional: true

  validates :route, presence: true
  validates :name, presence: true
  validates :walking_minutes, presence: true,
                              numericality: {
                                only_integer: true,
                                greater_than_or_equal_to: 0,
                                allow_blank: true
                              }
end
