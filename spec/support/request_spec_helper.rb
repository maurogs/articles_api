module RequestSpecHelper
  def rendered_json
    JSON.parse(response.body)
  end
end
