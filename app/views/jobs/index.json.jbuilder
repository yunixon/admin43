json.array!(@jobs) do |job|
  json.extract! job, :id, :employer_id, :name, :body, :status
  json.url job_url(job, format: :json)
end
