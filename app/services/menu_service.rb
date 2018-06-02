class MenuService

  def initialize(venue_id)
    @venue_id = venue_id
  end

  def run
    fetch
  end

  private

  def fetch
    response = Faraday.get("https://api.foursquare.com/v2/venues/#{@venue_id}/menu?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&&v=20180323")
    menus = JSON.parse(response.body)["response"]["menu"]["menus"]["items"]
    parse_menus(menus)
  end

  def parse_menus(menus)
    menu_objects = menus.map do |menu|
      Menu.new(menu)
    end
    make_foods(menu_objects)
  end

  def make_foods(menu_objects)
    menu_objects.each do |menu|
      foods = menu.data.map do |section|
        section["entries"]["items"].map do |food|
          Food.new(food)
        end
      end
      menu.foods << foods.flatten
    end
  end
end
