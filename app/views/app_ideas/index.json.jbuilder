json.array!(@app_ideas) do |app_idea|
  json.extract! app_idea, :id, :tweet
  json.url app_idea_url(app_idea, format: :json)
end
