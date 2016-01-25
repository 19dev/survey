json.array!(@users) do |user|
  json.extract! club, :id, :name, :logo, :supervisor, :regulation, :description, :email
  json.url club_url(club, format: :json)
end
