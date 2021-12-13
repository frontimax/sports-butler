# Sports Butler

![Image of Yaktocat](https://www.football-butler.de/wp-content/uploads/2021/03/cropped-cropped-cropped-logo_football_butler_128px_geen02-1.png)

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

[www.football-butler.de (Offical Gem Homepage)](https://www.football-butler.de)  
[www.code-butler.de (More Projects & Solutions with Rails & Flutter)](https://www.code-butler.de)  
[Twitter/code_butler](https://twitter.com/code_butler)

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
