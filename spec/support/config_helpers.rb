module ConfigHelpers
  # SOCCER
  def self.set_api_football_com
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:api_football_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:api_football_com]  = 'https://v3.football.api-sports.io'
    end
  end

  def self.set_apifootball_com
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:apifootball_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:apifootball_com]  = 'https://apiv2.apifootball.com'
    end
  end

  def self.set_football_data_org
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:football_data_org]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:football_data_org]  = 'https://api.football-data.org'
    end
  end

  # BASKETBALL
  def self.set_api_basketball_com
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:basketball][:api_basketball_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:basketball][:api_basketball_com]  = 'https://v3.basketball.api-sports.io'
    end
  end
end