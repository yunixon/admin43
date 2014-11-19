json.array!(@newslines) do |newsline|
  json.extract! newsline, :id, :name, :body, :status
  json.url newsline_url(newsline, format: :json)
end
