json.array!(@pass_codes) do |pass_code|
  json.extract! pass_code, :id, :passcode, :poll_id, :pass_code_is_finished
  json.url pass_code_url(pass_code, format: :json)
end
