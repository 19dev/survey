json.array!(@polls) do |poll|
  json.extract! poll, :id, :poll_name, :poll_description, :poll_start_date, :poll_finish_date
  json.url poll_url(poll, format: :json)
end
