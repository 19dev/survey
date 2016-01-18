json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_image, :question_id, :answer_description
  json.url answer_url(answer, format: :json)
end
