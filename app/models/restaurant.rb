class Restaurant
  include ActiveModel::Serialization
  attr_reader :venue_id, :name

  def initialize(info)
    @venue_id = info["id"]
    @name = info["name"]
    @street = info["location"]["address"]
    @city = info["location"]["city"]
    @state = info["location"]["state"]
    @zip = info["location"]["postalCode"]
  end

  def address
    "#{@street}, #{@city}, #{@state} #{@zip}"
  end
end
