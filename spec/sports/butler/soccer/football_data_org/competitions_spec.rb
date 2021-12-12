# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Competitions do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :competitions }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_competitions_football_data_org
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_competitions_all_football_data_org, :competitions
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Bundesliga' }
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 78,
                    :response_competitions_one_football_data_org, :competitions
  end
end

def stubs_competitions_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/competitions")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/competitions/78")
    .to_return(status: 200, body: get_mocked_response('competition.json', sport, api_name))
end

def aaa
  :football_data_org
end

def response_competitions_one_football_data_org
  {
    "count": 152,
    "filters": {}.with_indifferent_access,
    "competitions": [
               {
                 "id": 2006,
                 "area": {
                         "id": 2001,
                         "name": "Africa",
                         "countryCode": "AFR",
                         "ensignUrl": "null"
                       }.with_indifferent_access,
                 "name": "WC Qualification",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                         "id": 555,
                         "startDate": "2019-09-04",
                         "endDate": "2021-11-16",
                         "currentMatchday": "null",
                         "winner": "null"
                       }.with_indifferent_access,
                 "numberOfAvailableSeasons": 2,
                 "lastUpdated": "2018-06-04T23:54:04Z"
               }.with_indifferent_access,
               {
                 "id": 2023,
                 "area": {
                         "id": 2011,
                         "name": "Argentina",
                         "countryCode": "ARG",
                         "ensignUrl": "null"
                       }.with_indifferent_access,
                 "name": "Primera B Nacional",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                         "id": 716,
                         "startDate": "2021-03-13",
                         "endDate": "2021-12-26",
                         "currentMatchday": 3,
                         "winner": "null"
                       }.with_indifferent_access,
                 "numberOfAvailableSeasons": 5,
                 "lastUpdated": "2021-03-27T00:00:06Z"
               }.with_indifferent_access,
               {
                 "id": 2026,
                 "area": {
                         "id": 2015,
                         "name": "Australia",
                         "countryCode": "AUS",
                         "ensignUrl": "null"
                       }.with_indifferent_access,
                 "name": "FFA Cup",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                         "id": 592,
                         "startDate": "2020-02-19",
                         "endDate": "2020-10-28",
                         "currentMatchday": "null",
                         "winner": "null"
                       }.with_indifferent_access,
                 "numberOfAvailableSeasons": 3,
                 "lastUpdated": "2019-10-23T23:59:22Z"
               }.with_indifferent_access
             ]
  }.with_indifferent_access
end


def response_competitions_all_football_data_org
  {
    "count": 152,
    "filters": {}.with_indifferent_access,
    "competitions": [
               {
                 "id": 2006,
                 "area": {
                   "id": 2001,
                   "name": "Africa",
                   "countryCode": "AFR",
                   "ensignUrl": "null"
                 }.with_indifferent_access,
                 "name": "WC Qualification",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                   "id": 555,
                   "startDate": "2019-09-04",
                   "endDate": "2021-11-16",
                   "currentMatchday": "null",
                   "winner": "null"
                 }.with_indifferent_access,
                 "numberOfAvailableSeasons": 2,
                 "lastUpdated": "2018-06-04T23:54:04Z"
               }.with_indifferent_access,
               {
                 "id": 2023,
                 "area": {
                   "id": 2011,
                   "name": "Argentina",
                   "countryCode": "ARG",
                   "ensignUrl": "null"
                 }.with_indifferent_access,
                 "name": "Primera B Nacional",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                   "id": 716,
                   "startDate": "2021-03-13",
                   "endDate": "2021-12-26",
                   "currentMatchday": 3,
                   "winner": "null"
                 }.with_indifferent_access,
                 "numberOfAvailableSeasons": 5,
                 "lastUpdated": "2021-03-27T00:00:06Z"
               }.with_indifferent_access,
               {
                 "id": 2026,
                 "area": {
                   "id": 2015,
                   "name": "Australia",
                   "countryCode": "AUS",
                   "ensignUrl": "null"
                 }.with_indifferent_access,
                 "name": "FFA Cup",
                 "code": "null",
                 "emblemUrl": "null",
                 "plan": "TIER_FOUR",
                 "currentSeason": {
                   "id": 592,
                   "startDate": "2020-02-19",
                   "endDate": "2020-10-28",
                   "currentMatchday": "null",
                   "winner": "null"
                 }.with_indifferent_access,
                 "numberOfAvailableSeasons": 3,
                 "lastUpdated": "2019-10-23T23:59:22Z"
               }.with_indifferent_access
             ]
  }.with_indifferent_access
end
