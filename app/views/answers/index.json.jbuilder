json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_no, :answer_image, :question_no, :answer_description
  json.url answer_url(answer, format: :json)
end
