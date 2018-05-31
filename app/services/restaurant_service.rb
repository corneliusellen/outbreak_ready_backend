class RestaurantService

  def initialize(near, query)
    @near = near
    @query = query
  end

  def run
    fetch
  end

  private

  def fetch
    response = Faraday.get("https://api.foursquare.com/v2/venues/search?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&near=#{@near}&query=#{@query}&v=20180323")
    venues = JSON.parse(response.body)["response"]["venues"]
    find_restaurant_venues(venues)
  end

  def find_restaurant_venues(list)
    restaurants = list.find_all do |item|
      item["categories"].first["pluralName"].include?("Restaurant") rescue false
    end
    create_restaurants(restaurants)
  end

  def create_restaurants(restaurants)
    restaurants.map do |restaurant|
      Restaurant.new(restaurant)
    end
  end
end
