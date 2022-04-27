json.extract! workshop, :id, :name, :description, :start_date, :end_date, :start_time, :end_time, :total_sits, :remaining_sits, :registration_fee, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)
