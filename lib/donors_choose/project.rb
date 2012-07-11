# This API allows us to find information about DonorsChoose projects,
# so a Project is the main class of the gem.
class DonorsChoose::Project

  # This method finds all projects near a given latitude and longitude.
  def self.near_me(latitude, longitude)
    DonorsChoose::Request.get(:centerLat => latitude, :centerLong => longitude)
  end

  # This method allows you to look up all projects by a zip code.
  def self.by_zip(zipcode)
    DonorsChoose::Request.get(:zip => zipcode)
  end

  def self.by_id(id)
    DonorsChoose::Request.get(:id => id).first
  end

  def self.by_url(url)
    DonorsChoose::Request.get(:id => parse_id_from_url(url))
  end

  def self.parse_id_from_url url
    url.split('/').last
  end
end
