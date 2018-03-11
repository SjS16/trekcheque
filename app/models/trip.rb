class Trip < ApplicationRecord
  monetize :price_per_night_cents, :total_possible_cost_cents, :total_confirmed_cost_cents, numericality: true

  has_many :attendees
  has_many :expenses
  has_many :users, :through => :attendees

  validates :name, presence: true
  validates :number_of_possible_attendees, presence: true

  validate :validate_date

  def validate_date
    errors.add(:start_date, 'must be earlier than end date') if
    self.start_date >= self.end_date
  end

end
