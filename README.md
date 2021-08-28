# Sports Butler

![Image of Yaktocat](https://www.sports-butler.de/wp-content/uploads/2021/12/cropped-sb_logo_01_512px.png)

[![Build Status](https://app.travis-ci.com/frontimax/sports-butler.svg?token=kdzGtbwhXCggiYUeL5pd&branch=main&status=errored)](https://travis-ci.com/frontimax/sports-butler)
[![codecov](https://codecov.io/gh/frontimax/sports-butler/branch/main/graph/badge.svg?token=38e8a3b0-dfc4-4ffc-9202-29c51a6c033b)](https://codecov.io/gh/frontimax/sports-butler)

This gem enables API requests against multiple different sports APIs.

Its the follow-up Gem to [www.football-butler.de](https://www.football-butler.de), which only supported football (aka soccer).

Currently supported sports:
- Soccer (aka Football) ***[current default sport]***
- Basketball

**Note: more sports will be added in the future. Feel free to inform me, which sports or sepcific APIs you prefer.**

The following APIs are currently supported with endpoints classes 
(note: you can access any API directly with a generic get method, but supported APIs provide semantic endpoint classes and methods to access the given API as a comfort function):

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

This is a complete configuration example for all 4 supported APIs (2 sports):

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
        config.api_base_url[:soccer][:apifootball_com]   = 'https://apiv3.apifootball.com'
        # basketball
        config.api_base_url[:basketball][:api_basketball_com]   = 'https://v1.basketball.api-sports.io'
    end

Configuration explained:

| Attribute | Explanation |
| ---------------|----------------|
| **@api_token <br># default_api_hash # { soccer: {}, basketball: {} }** | The API Token is provided by your API Host.As this is a multiple sports multiple API Gem you have to fill the Hash accordingly. At least one api token for one API is required. |
| **@api_base_url <br># default_api_hash # { soccer: {}, basketball: {} }** | The API base url is provided by your API Host. As this is a multiple sports multiple API Gem you have to fill the Hash accordingly. At least one base url for one API is required. |
| **@header_token_name <br># set_header_token_name** | Default header API token setting for supported APIs. Can be overwritten. |
| **@header_additional <br># {}** | Additional (optional) header key/value pairs to be added (e.g. for API Tokens. |


## Usage

At least one api token and one base url for one API is required.
After your configuration is complete you can use sports-butler.

Build the sports butler object first:

    butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)

You only need the sport and api_name parameters, currently valid as shown:

    AVAILABLE_SPORT_API = {
        soccer: [:football_data_org, :apifootball_com, :api_football_com],
        basketball: [:api_basketball_com]
    }

Then you can call the endpoint with required and optional parameters (see list of all available endpoints and methods at the end of this readme) - some examples:

    butler.teams.by_id(id: 1)
    butler.countries.search_by_name(name: 'Germany')
    butler.matches.by_competition_and_year(competition_id: 17, year: 2021)

And you can add additional parameters with filters hash, accordingly to your API documentation:

    butler.matches.by_competition_and_year(competition_id: 17, year: 2021, filters: { from: '2021-09-01', to: '2021-12-31' })

The result is always the last API object (see below).

### Aliases

Some Endpoints provide alias methods, see list of all endpoints below for optional aliases. Example:

    butler.countries.search_by_name(name: 'Germany')
    butler.areas.search_by_name(name: 'Germany')

## Usage without endpoint methods (direct calls)

As in footbal butler gem you may also call a url with params directly, useful especially if an endpoint class or method is missing 
in this gem.

You can use the same configuration logic as described above, or deliver required token directly with the call.

When you set the sport and api_name parameter the configuration block will be used (if your configuration is invalid an error message is returned):

    Sports::Butler.get(url: 'https://v3.football.api-sports.io/teams?id=39', sport: :soccer, api_name: :api_football_com)

Or you can provide the token as part of the url:

    Sports::Butler.get(url: 'https://apiv2.apifootball.com/?action=get_teams&team_id=392&APIkey=<YOUR_TOKEN>')

Or you can provide the token via the headers:

    Sports::Butler.get(
        url: 'https://v3.football.api-sports.io/teams?id=39', 
        headers: { "x-apisports-key": '<YOUR_TOKEN>'}
    )

It will return the HTTParty::Response object, e.g.:

    {
        "get"=>"teams",
        "parameters"=>{"id"=>"39"},
        "errors"=>[],
        "results"=>1,
        "paging"=>{"current"=>1, "total"=>1},
        "response"=>
        [{"team"=>
        {"id"=>39,
        "name"=>"Wolves",
        "country"=>"England",
        "founded"=>1877,
        "national"=>false,
        "logo"=>"https://media.api-sports.io/football/teams/39.png"},
        "venue"=>
        {"id"=>600,
        "name"=>"Molineux Stadium",
        "address"=>"Waterloo Road",
        "city"=>"Wolverhampton, West Midlands",
        "capacity"=>32050,
        "surface"=>"grass",
        "image"=>"https://media.api-sports.io/football/venues/600.png"}}]
    }


## Error Messages

List of possible errors from sports butler itself (not from the API):

| Error Message | Explanation |
| ---------------|----------------|
| **You need to configure sports-butler first, see readme.** | You didnt deliver a configuration block (api token and/or base url), see above. |
| **Invalid sport / api parameter. Available sports: soccer, basketball. Available apis: football_data_org, apifootball_com, api_football_com, api_basketball_com** | When you enter an invalid sport / api combination (see Sports::Butler::Configuration::AVAILABLE_SPORT_API for reference) |
| **NOT AVAILABLE: the endpoint 'bazinga' is not available for this sport/api combination.** | When you called an invalid endpoint class. |
| **The method 'bazinga' is not available for endpoint 'countries' in API api_football_com.** | When you called an invalid method on an endpoint class. |
| **Invalid Configuration, check empty api_token or empty / invalid api_base_url.** | API token ist empty or base url is invalid. |
| **Country could not be found.** | The ressource could not be found on an endpoint method. |

## sports butler objects explained

### Sports butler object:

Sports::Butler::Soccer or Sports::Butler::Basketball.

| Attribute | Explanation |
| ---------------|----------------|
| **@api_class** | e.g. ApiFootballCom |
| **@api_name** | e.g. :api_football_com |
| **@sport** | e.g. :soccer |
| **@sport_class** | e.g. SoccerApi |
| **@available_endpoint** | Shows all available endpoints and endpoint methods for this API |
| **@endpoints** | All pre-build classes for all available endpoint classes |

### Endpoint objects:

e.g. Sports::Butler::SoccerApi::ApiFootballCom::Teams

| Attribute | Explanation |
| ---------------|----------------|
| **@api_name** | e.g. :api_football_com |
| **@sport** | e.g. :soccer |
| **@api** | The API object Sports::Butler::Api |

### API object:

Sports::Butler::Api

| Attribute | Explanation |
| ---------------|----------------|
| **@api_name** | e.g. :api_football_com |
| **@sport** | e.g. :soccer |
| **@success** | State of last API call (true or false) |
| **@response_code** | Response Code of last API call (200 for OK) |
| **@url** | Used Url of last API call |
| **@uri** | Used Uri of last API call |
| **@headers** | Used headers Url of last API call |
| **@errors** | Array of errors of last API call |
| **@query** | query params of last API call |
| **@response** | Array of errors of last API call |
| **@response** | HTTParty::Response of last API call |
| **@parsed_response** | parsed_response of last API call |

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
        @api_name=:api_football_com,
        @errors=[],
        @headers={"x-apisports-key"=>"<YOUR_TOKEN>"},
        @parsed_response=
        {"get"=>"teams",
        "parameters"=>{"id"=>"1"},
        "errors"=>[],
        "results"=>1,
        "paging"=>{"current"=>1, "total"=>1},
        "response"=>
        [{"team"=>
        {"id"=>1,
        "name"=>"Belgium",
        "country"=>"Belgium",
        "founded"=>1895,
        "national"=>true,
        "logo"=>"https://media.api-sports.io/football/teams/1.png"},
        "venue"=>
        {"id"=>173,
        "name"=>"Stade Roi Baudouin",
        "address"=>"Avenue de Marathon 135/2",
        "city"=>"Brussel",
        "capacity"=>50093,
        "surface"=>"grass",
        "image"=>"https://media.api-sports.io/football/venues/173.png"}}]},
        @query={:id=>1},
        @response=
        {"get"=>"teams",
        "parameters"=>{"id"=>"1"},
        "errors"=>[],
        "results"=>1,
        "paging"=>{"current"=>1, "total"=>1},
        "response"=>
        [{"team"=>
        {"id"=>1,
        "name"=>"Belgium",
        "country"=>"Belgium",
        "founded"=>1895,
        "national"=>true,
        "logo"=>"https://media.api-sports.io/football/teams/1.png"},
        "venue"=>
        {"id"=>173,
        "name"=>"Stade Roi Baudouin",
        "address"=>"Avenue de Marathon 135/2",
        "city"=>"Brussel",
        "capacity"=>50093,
        "surface"=>"grass",
        "image"=>"https://media.api-sports.io/football/venues/173.png"}}]},
        @response_code=200,
        @sport=:soccer,
        @success=true,
        @uri="https://v3.football.api-sports.io/teams?id=1",
        @url="https://v3.football.api-sports.io/teams"
    >

The configuration also changed to a more complex construct to enable multi-sports, multi-api configuration (see above).


## Available Endpoints

You can list all endpoints with:

    Sports::Butler.show_endpoints

Overview of all endpoints (and its optional aliases) of all sports and its APIs with required (:keyreq) and optional (:key) parameters:

**Note: The list of endpoints may not be complete, I gladly add new endpoints if you require them from your API. Please contact me via info@code-butler.de.**

**Also: If you find an eror in this gem I am happy to fix it as soon as possible. Please contact me via info@code-butler.de.**

<pre>
1. SPORT: soccer
==============================
Endpoints for this Sport:

1. coachs [ Aliases: - ]
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

3. countries [ Aliases: areas ]
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

4. head_to_head [ Aliases: - ]
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

5. injuries [ Aliases: - ]
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

6. lineups [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------+
|                                                         Endpoint lineups [soccer]                                                         |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| Method   | football_data_org                        | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+

7. matches [ Aliases: events, fixtures ]
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                             Endpoint matches [soccer]                                                                                                             |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| Method                   | football_data_org                                                | apifootball_com                                                                  | api_football_com                                                 |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_id                    | YES                                                              | YES                                                                              | YES                                                              |
|                          | [[:keyreq, :id], [:key, :filters]]                               | [[:keyreq, :id], [:key, :filters]]                                               | [[:keyreq, :id], [:key, :filters]]                               |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| all                      | YES                                                              | -                                                                                | YES                                                              |
|                          | [[:key, :filters]]                                               | -                                                                                | [[:key, :filters]]                                               |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_competition           | YES                                                              | -                                                                                | -                                                                |
|                          | [[:keyreq, :competition_id], [:key, :filters]]                   | -                                                                                | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_competition_and_year  | YES                                                              | YES                                                                              | YES                                                              |
|                          | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]]                 | [[:keyreq, :competition_id], [:keyreq, :year], [:key, :filters]] |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_team                  | YES                                                              | -                                                                                | -                                                                |
|                          | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                                | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_and_status       | YES                                                              | -                                                                                | -                                                                |
|                          | [[:keyreq, :team_id], [:keyreq, :status], [:key, :filters]]      | -                                                                                | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_finished         | YES                                                              | -                                                                                | -                                                                |
|                          | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                                | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_scheduled        | YES                                                              | -                                                                                | -                                                                |
|                          | [[:keyreq, :team_id], [:key, :filters]]                          | -                                                                                | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_team_and_range        | -                                                                | YES                                                                              | -                                                                |
|                          | -                                                                | [[:keyreq, :team_id], [:keyreq, :from], [:keyreq, :to], [:key, :filters]]        | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+
| by_competition_and_range | -                                                                | YES                                                                              | -                                                                |
|                          | -                                                                | [[:keyreq, :competition_id], [:keyreq, :from], [:keyreq, :to], [:key, :filters]] | -                                                                |
+--------------------------+------------------------------------------------------------------+----------------------------------------------------------------------------------+------------------------------------------------------------------+

8. odds [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------+
|                                                          Endpoint odds [soccer]                                                           |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| Method   | football_data_org                        | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+------------------------------------------+

9. players [ Aliases: - ]
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

10. predictions [ Aliases: - ]
+------------------------------------------------------------------------------------------------+
|                                 Endpoint predictions [soccer]                                  |
+----------+------------------------------------------+------------------------------------------+
| Method   | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+

11. scorers [ Aliases: top_scorers ]
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

12. sidelineds [ Aliases: - ]
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

13. standings [ Aliases: - ]
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                    Endpoint standings [soccer]                                                                    |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+
| Method         | football_data_org                              | apifootball_com                                | api_football_com                               |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+
| by_competition | YES                                            | YES                                            | YES                                            |
|                | [[:keyreq, :competition_id], [:key, :filters]] | [[:keyreq, :competition_id], [:key, :filters]] | [[:keyreq, :competition_id], [:key, :filters]] |
+----------------+------------------------------------------------+------------------------------------------------+------------------------------------------------+

14. statistics [ Aliases: - ]
+------------------------------------------------------------------------------------------------+
|                                  Endpoint statistics [soccer]                                  |
+----------+------------------------------------------+------------------------------------------+
| Method   | apifootball_com                          | api_football_com                         |
+----------+------------------------------------------+------------------------------------------+
| by_match | YES                                      | YES                                      |
|          | [[:keyreq, :match_id], [:key, :filters]] | [[:keyreq, :match_id], [:key, :filters]] |
+----------+------------------------------------------+------------------------------------------+

15. teams [ Aliases: - ]
+----------------------------------------------------------------------------------------------------------------------------+
|                                                  Endpoint teams [soccer]                                                   |
+---------+--------------------------------------+------------------------------------+--------------------------------------+
| Method  | football_data_org                    | apifootball_com                    | api_football_com                     |
+---------+--------------------------------------+------------------------------------+--------------------------------------+
| by_id   | YES                                  | YES                                | YES                                  |
|         | [[:keyreq, :id], [:key, :filters]]   | [[:keyreq, :id], [:key, :filters]] | [[:keyreq, :id], [:key, :filters]]   |
+---------+--------------------------------------+------------------------------------+--------------------------------------+
| by_name | YES                                  | -                                  | YES                                  |
|         | [[:keyreq, :name], [:key, :filters]] | -                                  | [[:keyreq, :name], [:key, :filters]] |
+---------+--------------------------------------+------------------------------------+--------------------------------------+

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

1. competitions [ Aliases: leagues ]
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

2. countries [ Aliases: areas ]
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

