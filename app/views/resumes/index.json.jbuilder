json.array!(@resumes) do |resume|
  json.extract! resume, :id, :user_id, :body, :status
  json.url resume_url(resume, format: :json)
end
