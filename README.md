# Sports Butler

![Image of Yaktocat](https://www.sports-butler.de/wp-content/uploads/2021/12/cropped-sb_logo_01_512px.png)

[![Build Status](https://app.travis-ci.com/frontimax/sports-butler.svg?token=kdzGtbwhXCggiYUeL5pd&branch=main&status=errored)](https://travis-ci.com/frontimax/sports-butler)
# TODO: football-butler !!!
[![codecov](https://codecov.io/gh/frontimax/football-butler/branch/main/graph/badge.svg?token=GBV4PK62WC)](https://codecov.io/gh/frontimax/football-butler)

This gem enables API requests against multiple different sports APIs.

Its the follow-up Gem to [www.football-butler.de](https://www.football-butler.de), which only supported football (aka soccer).

Currently supported sports:
- Soccer (aka Football) ***[current default sport]***
- Basketball

**Note: more sports will be added in the future. Feel free to inform me, which sports or sepcific APIs you prefer.**

Currenlty supported APIs (note: you can access any API directly with a unified get, but supported APIs provide semantic endpoint classes and methods to access the given API as a comfort function):

*Soccer (aka Football)*
- api-football.com ***[current default api]***
- apifootball.com
- football-data.org

*Basketball*
- api-basketball.com ***[current default api]***


To use the API you need an API token, get it for free @
- https://dashboard.api-football.com/register
- https://apifootball.com/register
- http://api.football-data.org/register
- https://rapidapi.com/api-sports/api/api-basketball/pricing


Depending on you Payment Plan or Subscription you can access international Competitions, Teams, Matches, Scores, Players, Odds, and Standings.

Also see the following Links:

[www.sports-butler.de (Offical Gem Homepage)](https://www.sports-butler.de)  
[www.code-butler.de (More Projects & Solutions with Rails & Flutter)](https://www.code-butler.de)  
[Twitter/code_butler](https://twitter.com/code_butler)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sports-butler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sports-butler

## Configuration

Add a new file: 

    config/initializers/spors_butler.rb

This is a complete config example for all 4 supported APIs (2 sports):

**Of course you should never commit a real token into your project: use .env instead!**

    Sports::Butler::Configuration.configure do |config|
        # api_token
        config.api_token = { soccer: {}, basketball: {} }
        
        # soccer
        config.api_token[:soccer][:api_football_com]  = <YOUR_TOKEN>
        config.api_token[:soccer][:football_data_org] = <YOUR_TOKEN>
        config.api_token[:soccer][:apifootball_com]   = <YOUR_TOKEN>
        # basketball
        config.api_token[:basketball][:api_basketball_com]   = <YOUR_TOKEN>
        
        # api_base_url
        config.api_base_url = { soccer: {}, basketball: {} }
        # soccer
        config.api_base_url[:soccer][:api_football_com]  = 'https://v3.football.api-sports.io'
        config.api_base_url[:soccer][:football_data_org] = 'https://api.football-data.org/v2'
        config.api_base_url[:soccer][:apifootball_com]   = 'https://apiv2.apifootball.com'
        # basketball
        config.api_base_url[:basketball][:api_basketball_com]   = 'https://v1.basketball.api-sports.io'
    end

Configuration explained:

    @api_token ||= default_api_hash # { soccer: {}, basketball: {} }

The API Token is provided by your API Host. 
As this is a multiple sports multiple API Gem you have to fill the Hash accordingly.    
At least one api token for one API is required.

    @api_base_url  ||= default_api_hash # { soccer: {}, basketball: {} }

The API base url is provided by your API Host. 
As this is a multiple sports multiple API Gem you have to fill the Hash accordingly.
At least one api token for one API is required.

    @header_token_name ||= set_header_token_name
    # {
        soccer: {
          football_data_org: 'X-Auth-Token',
          api_football_com: 'x-apisports-key'
        },
        basketball: {
          api_basketball_com: 'x-apisports-key'
        }
      }

Default header token setting. Can be overwritten.

    @header_additional ||= {}

Additional header key/value pairs to be added.

## Usage

At least one api token and one base url for one API is required.
After your configuration is complete you can user sports-butler like this:

Build the sports butler object first:

    butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)

You only need the sport and api_name parameters, currently valid as shown:

    AVAILABLE_SPORT_API = {
        soccer: [:football_data_org, :apifootball_com, :api_football_com],
        basketball: [:api_basketball_com]
    }

Then you can call the endpoint with required and optional parameters:

    butler.teams.by_id(id: 1)
    butler.countries.search_by_name(name: 'Germany')
    butler.matches.by_competition_and_year(competition_id: 17, year: 2021)

And you can add additional parameters with filters hash, accordingly to your API documentation:

    butler.matches.by_competition_and_year(competition_id: 17, year: 2021, filters: { from: '2021-09-01', to: '2021-12-31' })

The result is always the last API object:

## Usage without endpoint methods (direct calls)

As in footbal butler you may also call the url withs params directly, espacially if an endpoint class or method is missing 
in this gem:

### TODO: configuration not invoked yet!

    Sports::Butler.get()

## Error Messages

| Error Message | Explanation |
| ---------------|----------------|
| **You need to configure sports-butler first, see readme.** | You didnt deliver a configuration block (api token and/or base url), see above. |

List of possible errors from sports butler itself (not from the API):
    
    You need to configure sports-butler first, see readme.

You didnt deliver a configuration block (api token and/or base url), see above.

    Invalid sport / api parameter. Available sports: soccer, basketball. Available apis: football_data_org, apifootball_com, api_football_com, api_basketball_com

When you enter an invalid sport / api combination (see Sports::Butler::Configuration::AVAILABLE_SPORT_API for reference)

    NOT AVAILABLE: the endpoint 'bazinga' is not available for this sport/api combination.

When you called an invalid endpoint class.

    The method '#{meth}' is not available for endpoint '#{described_class.name.demodulize}' in API #{api_name}.

When you called an invalid method on an endpoint class.

    
## sports butler objects explained

The sports butler object:

    n/a

The endpoint objects:

    n/a

The API objects

    n/a

## Differences to previous gem football-butler

football-butler only provided a multi wrapper for football (soccer) - obviously.

sports-butler also supports multi sports, initially adding a basketball API (https://www.api-basketball.com).

The main difference in code: while football-butler used class methods, sports-butler uses an object-oriented apprach.

A short example:

*football-butler (old):*

    Football::Butler::Matches.by_competition(id: 2002)

*sports-butler:*

    butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)
    butler.matches.by_competition(id: 2002)

While football-butler returned a result as a Hash or Array, sports-butler always returns the used API object (see above for more details and explanation), e.g.:

    #<Sports::Butler::Api:0x00007f92f5931f40
        @api_name=:football_data_org,
        @errors=[],
        @headers={"X-Auth-Token"=>"<YOUR_TOKEN>"},
        @query={},
        @response={"message"=>"The resource you are looking for does not exist.", "error"=>404},
        @response_code=404,
        @response_processed={"message"=>"The resource you are looking for does not exist."},
        @sport=:soccer,
        @success=false,
        @url="https://api.football-data.org/v2/competitions/31/standings"
    >

The configuration also changed to a more complex construct to enable multi-sports, multi-api configuration (see above).


## Available Endpoints

You can list all endpoints with:

    Sports::Butler.show_endpoints

Overview of all endpoints (and its optional aliases) of all sports and its APIs with required (:keyreq) and optional (:key) parameters:

**Note: The list of endpoints may not be complete, I gladly add new endpoints if you require them from your API. PLease drop me a message.**

<pre>
1. SPORT: soccer
==============================
Endpoints for this Sport:

1. countries [ Aliases: areas ]
+--------------------------------------------------------------------------------------------------------------------+
|                                            Endpoint countries [soccer]                                             |
+----------------+---------------------------------------+--------------------+--------------------------------------+
| Method         | football_data_org                     | apifootball_com    | api_football_com                     |
+----------------+---------------------------------------+--------------------+--------------------------------------+
| all            | YES                                   | YES                | YES                                  |
|                | [[:key, :filters]]                    | [[:key, :filters]] | [[:key, :filters]]                   |
+----------------+---------------------------------------+--------------------+--------------------------------------+
| by_name        | YES                                   | -                  | YES                                  |
|                | [[:keyreq, :name], [:key, :_filters]] | -                  | [[:keyreq, :name], [:key, :filters]] |
+----------------+---------------------------------------+--------------------+--------------------------------------+
| by_id          | YES                                   | -                  | -                                    |
|                | [[:keyreq, :id], [:key, :filters]]    | -                  | -                                    |
+----------------+---------------------------------------+--------------------+--------------------------------------+
| search_by_name | -                                     | -                  | YES                                  |
|                | -                                     | -                  | [[:keyreq, :name], [:key, :filters]] |
+----------------+---------------------------------------+--------------------+--------------------------------------+

2. competitions [ Aliases: leagues ]
+--------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                          Endpoint competitions [soccer]                                                          |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| Method          | football_data_org                  | apifootball_com                            | api_football_com                             |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| all             | YES                                | YES                                        | YES                                          |
|                 | [[:key, :filters]]                 | [[:key, :filters]]                         | [[:key, :filters]]                           |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| by_id           | YES                                | -                                          | YES                                          |
|                 | [[:keyreq, :id], [:key, :filters]] | -                                          | [[:keyreq, :id], [:key, :filters]]           |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| by_country      | -                                  | YES                                        | -                                            |
|                 | -                                  | [[:keyreq, :country_id], [:key, :filters]] | -                                            |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| search_by_name  | -                                  | -                                          | YES                                          |
|                 | -                                  | -                                          | [[:keyreq, :name], [:key, :filters]]         |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| by_country_name | -                                  | -                                          | YES                                          |
|                 | -                                  | -                                          | [[:keyreq, :country_name], [:key, :filters]] |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| seasons         | -                                  | -                                          | YES                                          |
|                 | -                                  | -                                          | [[:key, :filters]]                           |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| leagues         | -                                  | -                                          | YES                                          |
|                 | -                                  | -                                          | [[:key, :filters]]                           |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+
| cups            | -                                  | -                                          | YES                                          |
|                 | -                                  | -                                          | [[:key, :filters]]                           |
+-----------------+------------------------------------+--------------------------------------------+----------------------------------------------+

3. matches [ Aliases: events, fixtures ]
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                    Endpoint matches [soccer]                                                                                                     |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| Method                  | football_data_org                                                | apifootball_com                                                  | api_football_com                                                 |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_id                   | YES                                                              | YES                                                              | YES                                                              |
|                         | [[:keyreq, :id], [:key, :filters]]                               | [[:keyreq, :id], [:key, :filters]]                               | [[:keyreq, :id], [:key, :filters]]                               |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| all                     | YES                                                              | -                                                                | YES                                                              |
|                         | [[:key, :filters]]                                               | -                                                                | [[:key, :filters]]                                               |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_competition          | YES                                                              | YES                                                              | -                                                                |
|                         | [[:keyreq, :competition_id], [:key, :filters]]                   | [[:keyreq, :competition_id], [:key, :filters]]                   | -                                                                |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_competition_and_year | YES                                                              | YES                                                              | YES                                                              |
|                         | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_team                 | YES                                                              | YES                                                              | -                                                                |
|                         | [[:keyreq, :team_id], [:key, :filters]]                          | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_and_status      | YES                                                              | -                                                                | -                                                                |
|                         | [[:keyreq, :team_id], [:keyreq, :status], [:key, :filters]]      | -                                                                | -                                                                |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_finished        | YES                                                              | -                                                                | -                                                                |
|                         | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                | -                                                                |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_scheduled       | YES                                                              | -                                                                | -                                                                |
|                         | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                | -                                                                |
+-------------------------+------------------------------------------------------------------+------------------------------------------------------------------+------------------------------------------------------------------+

4. teams [ Aliases: - ]
+------------------------------------------------------------------------------------------------------------------------------+
|                                                   Endpoint teams [soccer]                                                    |
+---------+--------------------------------------+--------------------------------------+--------------------------------------+
| Method  | football_data_org                    | apifootball_com                      | api_football_com                     |
+---------+--------------------------------------+--------------------------------------+--------------------------------------+
| by_id   | YES                                  | YES                                  | YES                                  |
|         | [[:keyreq, :id], [:key, :filters]]   | [[:keyreq, :id], [:key, :filters]]   | [[:keyreq, :id], [:key, :filters]]   |
+---------+--------------------------------------+--------------------------------------+--------------------------------------+
| by_name | YES                                  | YES                                  | YES                                  |
|         | [[:keyreq, :name], [:key, :filters]] | [[:keyreq, :name], [:key, :filters]] | [[:keyreq, :name], [:key, :filters]] |
+---------+--------------------------------------+--------------------------------------+--------------------------------------+

5. players [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                               Endpoint players [soccer]                                                               |
+------------------+------------------------------------+--------------------------------------+--------------------------------------------------------+
| Method           | football_data_org                  | apifootball_com                      | api_football_com                                       |
+------------------+------------------------------------+--------------------------------------+--------------------------------------------------------+
| by_id            | YES                                | YES                                  | -                                                      |
|                  | [[:keyreq, :id], [:key, :filters]] | [[:keyreq, :id], [:key, :filters]]   | -                                                      |
+------------------+------------------------------------+--------------------------------------+--------------------------------------------------------+
| by_name          | -                                  | YES                                  | -                                                      |
|                  | -                                  | [[:keyreq, :name], [:key, :filters]] | -                                                      |
+------------------+------------------------------------+--------------------------------------+--------------------------------------------------------+
| by_id_and_season | -                                  | -                                    | YES                                                    |
|                  | -                                  | -                                    | [[:keyreq, :id], [:keyreq, :season], [:key, :filters]] |
+------------------+------------------------------------+--------------------------------------+--------------------------------------------------------+

6. head_to_head [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                 Endpoint head_to_head [soccer]                                                                                  |
+----------+------------------------------------------+---------------------------------------------------------------------+---------------------------------------------------------------------+
| Method   | football_data_org                        | apifootball_com                                                     | api_football_com                                                    |
+----------+------------------------------------------+---------------------------------------------------------------------+---------------------------------------------------------------------+
| by_match | YES                                      | -                                                                   | -                                                                   |
|          | [[:keyreq, :match_id], [:key, :filters]] | -                                                                   | -                                                                   |
+----------+------------------------------------------+---------------------------------------------------------------------+---------------------------------------------------------------------+
| by_teams | -                                        | YES                                                                 | YES                                                                 |
|          | -                                        | [[:keyreq, :team_id], [:keyreq, :second_team_id], [:key, :filters]] | [[:keyreq, :team_id], [:keyreq, :second_team_id], [:key, :filters]] |
+----------+------------------------------------------+---------------------------------------------------------------------+---------------------------------------------------------------------+

7. lineups [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------+
|                                                         Endpoint lineups [soccer]                                                         |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| Method   | football_data_org                        | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+

8. odds [ Aliases: - ]
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                 Endpoint odds [soccer]                                                                                 |
+---------------------+------------------------------------------+----------------------------------------------------------------------------+------------------------------------------+
| Method              | football_data_org                        | apifootball_com                                                            | api_football_com                         |
+---------------------+------------------------------------------+----------------------------------------------------------------------------+------------------------------------------+
| by_match            | YES                                      | -                                                                          | YES                                      |
|                     | [[:keyreq, :match_id], [:key, :filters]] | -                                                                          | [[:keyreq, :match_id], [:key, :filters]] |
+---------------------+------------------------------------------+----------------------------------------------------------------------------+------------------------------------------+
| by_match_with_range | -                                        | YES                                                                        | -                                        |
|                     | -                                        | [[:keyreq, :match_id], [:keyreq, :from], [:keyreq, :to], [:key, :filters]] | -                                        |
+---------------------+------------------------------------------+----------------------------------------------------------------------------+------------------------------------------+

9. scorers [ Aliases: top_scorers ]
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                  Endpoint scorers [soccer]                                                                                   |
+-------------------------+------------------------------------------------+------------------------------------------------+------------------------------------------------------------------+
| Method                  | football_data_org                              | apifootball_com                                | api_football_com                                                 |
+-------------------------+------------------------------------------------+------------------------------------------------+------------------------------------------------------------------+
| by_competition          | YES                                            | YES                                            | -                                                                |
|                         | [[:keyreq, :competition_id], [:key, :filters]] | [[:keyreq, :competition_id], [:key, :filters]] | -                                                                |
+-------------------------+------------------------------------------------+------------------------------------------------+------------------------------------------------------------------+
| by_competition_and_year | -                                              | -                                              | YES                                                              |
|                         | -                                              | -                                              | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] |
+-------------------------+------------------------------------------------+------------------------------------------------+------------------------------------------------------------------+

10. standings [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                    Endpoint standings [soccer]                                                                    |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+
| Method         | football_data_org                              | apifootball_com                                | api_football_com                               |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+
| by_competition | YES                                            | YES                                            | YES                                            |
|                | [[:keyreq, :competition_id], [:key, :filters]] | [[:keyreq, :competition_id], [:key, :filters]] | [[:keyreq, :competition_id], [:key, :filters]] |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+

11. coachs [ Aliases: - ]
+----------------------------------------------------------+
|                 Endpoint coachs [soccer]                 |
+----------------+-----------------------------------------+
| Method         | api_football_com                        |
+----------------+-----------------------------------------+
| by_id          | YES                                     |
|                | [[:keyreq, :id], [:key, :filters]]      |
+----------------+-----------------------------------------+
| search_by_name | YES                                     |
|                | [[:keyreq, :name], [:key, :filters]]    |
+----------------+-----------------------------------------+
| by_team        | YES                                     |
|                | [[:keyreq, :team_id], [:key, :filters]] |
+----------------+-----------------------------------------+

12. injuries [ Aliases: - ]
+------------------------------------------------------------------------------------------------+
|                                   Endpoint injuries [soccer]                                   |
+---------------------------+--------------------------------------------------------------------+
| Method                    | api_football_com                                                   |
+---------------------------+--------------------------------------------------------------------+
| by_competition_and_season | YES                                                                |
|                           | [[:keyreq, :competition_id], [:keyreq, :season], [:key, :filters]] |
+---------------------------+--------------------------------------------------------------------+
| by_match                  | YES                                                                |
|                           | [[:keyreq, :match_id], [:key, :filters]]                           |
+---------------------------+--------------------------------------------------------------------+
| by_team_and_season        | YES                                                                |
|                           | [[:keyreq, :team_id], [:keyreq, :season], [:key, :filters]]        |
+---------------------------+--------------------------------------------------------------------+

13. predictions [ Aliases: - ]
+------------------------------------------------------------------------------------------------+
|                                 Endpoint predictions [soccer]                                  |
+----------+------------------------------------------+------------------------------------------+
| Method   | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+

14. sidelineds [ Aliases: - ]
+-------------------------------------------------------+
|             Endpoint sidelineds [soccer]              |
+-----------+-------------------------------------------+
| Method    | api_football_com                          |
+-----------+-------------------------------------------+
| by_player | YES                                       |
|           | [[:keyreq, :player_id], [:key, :filters]] |
+-----------+-------------------------------------------+
| by_coach  | YES                                       |
|           | [[:keyreq, :coach_id], [:key, :filters]]  |
+-----------+-------------------------------------------+

15. statistics [ Aliases: - ]
+------------------------------------------------------------------------------------------------+
|                                  Endpoint statistics [soccer]                                  |
+----------+------------------------------------------+------------------------------------------+
| Method   | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+

16. timezones [ Aliases: - ]
+-----------------------------+
| Endpoint timezones [soccer] |
+--------+--------------------+
| Method | api_football_com   |
+--------+--------------------+
| all    | YES                |
|        | [[:key, :filters]] |
+--------+--------------------+

17. transfers [ Aliases: - ]
+-------------------------------------------------------+
|              Endpoint transfers [soccer]              |
+-----------+-------------------------------------------+
| Method    | api_football_com                          |
+-----------+-------------------------------------------+
| by_player | YES                                       |
|           | [[:keyreq, :player_id], [:key, :filters]] |
+-----------+-------------------------------------------+
| by_team   | YES                                       |
|           | [[:keyreq, :team_id], [:key, :filters]]   |
+-----------+-------------------------------------------+

18. trophies [ Aliases: - ]
+-------------------------------------------------------+
|              Endpoint trophies [soccer]               |
+-----------+-------------------------------------------+
| Method    | api_football_com                          |
+-----------+-------------------------------------------+
| by_player | YES                                       |
|           | [[:keyreq, :player_id], [:key, :filters]] |
+-----------+-------------------------------------------+
| by_coach  | YES                                       |
|           | [[:keyreq, :coach_id], [:key, :filters]]  |
+-----------+-------------------------------------------+

19. venues [ Aliases: - ]
+---------------------------------------------+
|          Endpoint venues [soccer]           |
+--------+------------------------------------+
| Method | api_football_com                   |
+--------+------------------------------------+
| by_id  | YES                                |
|        | [[:keyreq, :id], [:key, :filters]] |
+--------+------------------------------------+


2. SPORT: basketball
==============================
Endpoints for this Sport:

1. countries [ Aliases: areas ]
+-------------------------------------------------------+
|            Endpoint countries [basketball]            |
+----------------+--------------------------------------+
| Method         | api_basketball_com                   |
+----------------+--------------------------------------+
| all            | YES                                  |
|                | [[:key, :filters]]                   |
+----------------+--------------------------------------+
| by_name        | YES                                  |
|                | [[:keyreq, :name], [:key, :filters]] |
+----------------+--------------------------------------+
| by_id          | YES                                  |
|                | [[:keyreq, :id], [:key, :filters]]   |
+----------------+--------------------------------------+
| by_code        | YES                                  |
|                | [[:keyreq, :code], [:key, :filters]] |
+----------------+--------------------------------------+
| search_by_name | YES                                  |
|                | [[:keyreq, :name], [:key, :filters]] |
+----------------+--------------------------------------+

2. competitions [ Aliases: leagues ]
+----------------------------------------------------------------+
|               Endpoint competitions [basketball]               |
+-----------------+----------------------------------------------+
| Method          | api_basketball_com                           |
+-----------------+----------------------------------------------+
| all             | YES                                          |
|                 | [[:key, :filters]]                           |
+-----------------+----------------------------------------------+
| by_id           | YES                                          |
|                 | [[:keyreq, :id], [:key, :filters]]           |
+-----------------+----------------------------------------------+
| by_name         | YES                                          |
|                 | [[:keyreq, :name], [:key, :filters]]         |
+-----------------+----------------------------------------------+
| by_country_name | YES                                          |
|                 | [[:keyreq, :country_name], [:key, :filters]] |
+-----------------+----------------------------------------------+
| by_country      | YES                                          |
|                 | [[:keyreq, :country_id], [:key, :filters]]   |
+-----------------+----------------------------------------------+
| cups            | YES                                          |
|                 | [[:key, :filters]]                           |
+-----------------+----------------------------------------------+
| leagues         | YES                                          |
|                 | [[:key, :filters]]                           |
+-----------------+----------------------------------------------+
| by_season       | YES                                          |
|                 | [[:keyreq, :season], [:key, :filters]]       |
+-----------------+----------------------------------------------+

3. matches [ Aliases: events, fixtures ]
+--------------------------------------------------------------------------------------------+
|                               Endpoint matches [basketball]                                |
+-------------------------+------------------------------------------------------------------+
| Method                  | api_basketball_com                                               |
+-------------------------+------------------------------------------------------------------+
| by_id                   | YES                                                              |
|                         | [[:keyreq, :id], [:key, :filters]]                               |
+-------------------------+------------------------------------------------------------------+
| by_competition_and_year | YES                                                              |
|                         | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] |
+-------------------------+------------------------------------------------------------------+
| all                     | YES                                                              |
|                         | [[:key, :filters]]                                               |
+-------------------------+------------------------------------------------------------------+

4. odds [ Aliases: - ]
+-----------------------------------------------------+
|             Endpoint odds [basketball]              |
+----------+------------------------------------------+
| Method   | api_basketball_com                       |
+----------+------------------------------------------+
| by_match | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+

5. seasons [ Aliases: - ]
+-------------------------------+
| Endpoint seasons [basketball] |
+----------+--------------------+
| Method   | api_basketball_com |
+----------+--------------------+
| all      | YES                |
|          | [[:key, :filters]] |
+----------+--------------------+

6. standings [ Aliases: - ]
+------------------------------------------------------------------------------------------------------------------------------+
|                                               Endpoint standings [basketball]                                                |
+------------------------------------+-----------------------------------------------------------------------------------------+
| Method                             | api_basketball_com                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------+
| by_competition_and_team_and_season | YES                                                                                     |
|                                    | [[:keyreq, :competition_id], [:keyreq, :team_id], [:keyreq, :season], [:key, :filters]] |
+------------------------------------+-----------------------------------------------------------------------------------------+

7. statistics [ Aliases: - ]
+------------------------------------------------------------------------------------------------------------------------------+
|                                               Endpoint statistics [basketball]                                               |
+------------------------------------+-----------------------------------------------------------------------------------------+
| Method                             | api_basketball_com                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------+
| by_competition_and_team_and_season | YES                                                                                     |
|                                    | [[:keyreq, :competition_id], [:keyreq, :team_id], [:keyreq, :season], [:key, :filters]] |
+------------------------------------+-----------------------------------------------------------------------------------------+

8. teams [ Aliases: - ]
+-----------------------------------------------------------------+
|                   Endpoint teams [basketball]                   |
+----------------+------------------------------------------------+
| Method         | api_basketball_com                             |
+----------------+------------------------------------------------+
| by_id          | YES                                            |
|                | [[:keyreq, :id], [:key, :filters]]             |
+----------------+------------------------------------------------+
| by_name        | YES                                            |
|                | [[:keyreq, :name], [:key, :filters]]           |
+----------------+------------------------------------------------+
| by_competition | YES                                            |
|                | [[:keyreq, :competition_id], [:key, :filters]] |
+----------------+------------------------------------------------+
| by_season      | YES                                            |
|                | [[:keyreq, :season], [:key, :filters]]         |
+----------------+------------------------------------------------+
| search_by_name | YES                                            |
|                | [[:keyreq, :name], [:key, :filters]]           |
+----------------+------------------------------------------------+

9. timezones [ Aliases: - ]
+---------------------------------+
| Endpoint timezones [basketball] |
+------------+--------------------+
| Method     | api_basketball_com |
+------------+--------------------+
| all        | YES                |
|            | [[:key, :filters]] |
+------------+--------------------+

</pre>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frontimax/football-butler.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere
to the [code of conduct](https://github.com/frontimax/sports-butler/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Football Butler project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/frontimax/sports-butler/blob/master/CODE_OF_CONDUCT.md).

