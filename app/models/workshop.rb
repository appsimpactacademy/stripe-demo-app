class Workshop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :registration_fee, :total_sits, presence: true, numericality: true
  validates :start_date, :end_date, :start_time, :end_time, presence: true
  validates :end_date, comparison: { greater_than: :start_date, message: 'can not be before start date' }

  def daily_workshop_hours
    "#{((start_time.to_time - end_time.to_time)/ 1.hours).abs} hours"
  end

  def total_duration
    "From #{start_date} to #{end_date}"
  end

  def daily_duration
    "Everyday #{start_time} to #{end_time} (#{daily_workshop_hours})"
  end
end
