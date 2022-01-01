# Sports Butler

![Image of Yaktocat](https://www.sports-butler.de/wp-content/uploads/2021/12/cropped-sb_logo_01_512px.png)

[![Build Status](https://app.travis-ci.com/frontimax/sports-butler.svg?token=kdzGtbwhXCggiYUeL5pd&branch=main&status=errored)](https://travis-ci.com/frontimax/sports-butler)
[![codecov](https://codecov.io/gh/frontimax/football-butler/branch/main/graph/badge.svg?token=GBV4PK62WC)](https://codecov.io/gh/frontimax/football-butler)

This gem enables API requests against multiple different sports APIs.

Its the follow-up Gem to [www.football-butler.de](https://www.football-butler.de), which only supported football/soccer.

Currently supported sports:
- Soccer (aka Football) ***[current default sport]***
- Basketball

Currenlty supported APIs (note: you can access any API directly, but supported APIs provide semantic methods to access the given API as a comfort function):

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

# Differences to previous gem football-butler

football-butler only provided a multi wrapper for football (soccer) - obviously.

sports-butler also supports multi sports, initially adding a basketball API (https://www.api-basketball.com).

The main difference in code: while football-butler used class methods, sports-butler uses an object-oriented apprach.

In Short an example:

*football-butler:*

    Football::Butler::Matches.by_competition(id: 2002)

*sports-butler:*

    butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)
    butler.matches.by_competition(id: 2002)

While football-butler returned a result as a Hash or Array, sports-butler always returns the used API object, e.g.:

    #<Sports::Butler::Api:0x00007f92f5931f40
    @api_name=:football_data_org,
    @errors=[],
    @headers={"X-Auth-Token"=>"123456789abcdefg"},
    @query={},
    @response={"message"=>"The resource you are looking for does not exist.", "error"=>404},
    @response_code=404,
    @response_processed={"message"=>"The resource you are looking for does not exist."},
    @sport=:soccer,
    @success=false,
    @url="https://api.football-data.org/v2/competitions/31/standings">

# Available Endpoints
## Countries

    butler = Sports::Butler.new()
    butler.countries

### Aliases

    areas

### Methods

| Method | Params required |
| ---------------|----------------|
| all | - | |
| by_name | name: String |

### APIs Soccer

| API | methods available |
| ---------------|----------------|
| api_football_com | all, by_name |
| apifootball_com | all, by_name |
| football_data_org | all, by_name |

### APIs Basketball

| API | methods available |
| ---------------|----------------|
| api_basketball_com | :all, :by_name |

Examples:

    butler.countries.all
    butler.countries.by_name(name: 'Germany')


## Competitions

    butler = Sports::Butler.new()
    butler.competitions

### Aliases

    leagues

### Methods

| Method | Params required |
| ---------------|----------------|
| all | - | |
| by_name | name: String |

### APIs Soccer

| API | methods available |
| ---------------|----------------|
| api_football_com | all |
| apifootball_com | all |
| football_data_org | all |

### APIs Basketball

| API | methods available |
| ---------------|----------------|
| api_basketball_com | :all |

Examples:

    butler.competitions.all
    butler.competitions.by_name(name: 'Bundesliga')


### Sports::Butler.show_endpoints

1. SPORT: soccer
   ==============================
   Endpoints for this Sport:

1. countries
   +-------------------------------------------------------------------------------------------------------------------------------+
   |                                                  Endpoint countries [soccer]                                                  |
   +---------+---------------------------------------+--------------------------------------+--------------------------------------+
   | Method  | football_data_org                     | apifootball_com                      | api_football_com                     |
   +---------+---------------------------------------+--------------------------------------+--------------------------------------+
   | all     | YES                                   | YES                                  | YES                                  |
   |         | none                                  | none                                 | none                                 |
   +---------+---------------------------------------+--------------------------------------+--------------------------------------+
   | by_name | YES                                   | YES                                  | YES                                  |
   |         | [[:keyreq, :name], [:key, :_filters]] | [[:keyreq, :name], [:key, :filters]] | [[:keyreq, :name], [:key, :filters]] |
   +---------+---------------------------------------+--------------------------------------+--------------------------------------+
   | by_id   | YES                                   | -                                    | -                                    |
   |         | [[:keyreq, :id], [:key, :filters]]    | -                                    | -                                    |
   +---------+---------------------------------------+--------------------------------------+--------------------------------------+

2. competitions
   +----------------------------------------------------------------------------------------------------+
   |                                   Endpoint competitions [soccer]                                   |
   +--------+------------------------------------+-----------------+------------------------------------+
   | Method | football_data_org                  | apifootball_com | api_football_com                   |
   +--------+------------------------------------+-----------------+------------------------------------+
   | all    | YES                                | YES             | YES                                |
   |        | none                               | none            | none                               |
   +--------+------------------------------------+-----------------+------------------------------------+
   | by_id  | YES                                | -               | YES                                |
   |        | [[:keyreq, :id], [:key, :filters]] | -               | [[:keyreq, :id], [:key, :filters]] |
   +--------+------------------------------------+-----------------+------------------------------------+


2. SPORT: basketball
   ==============================
   Endpoints for this Sport:

1. countries
   +------------------------------------------------+
   |        Endpoint countries [basketball]         |
   +---------+--------------------------------------+
   | Method  | api_basketball_com                   |
   +---------+--------------------------------------+
   | all     | YES                                  |
   |         | none                                 |
   +---------+--------------------------------------+
   | by_name | YES                                  |
   |         | [[:keyreq, :name], [:key, :filters]] |
   +---------+--------------------------------------+

2. competitions
   +---------------------------------------------+
   |     Endpoint competitions [basketball]      |
   +--------+------------------------------------+
   | Method | api_basketball_com                 |
   +--------+------------------------------------+
   | all    | YES                                |
   |        | none                               |
   +--------+------------------------------------+
   | by_id  | YES                                |
   |        | [[:keyreq, :id], [:key, :filters]] |
   +--------+------------------------------------+
