json.array!(@questions) do |question|
  json.extract! question, :id, :question_no, :question_header, :survey_no_id
  json.url question_url(question, format: :json)
end
