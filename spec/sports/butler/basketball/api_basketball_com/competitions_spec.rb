# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Competitions do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :competitions }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_competitions_api_basketball_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_competitions_all_api_basketball_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Bundesliga' }
  end
end

def stubs_competitions_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/leagues")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))
end

def aaa
  :api_basketball_com
end

def response_competitions_all_api_basketball_com
  [
             {
               "id": 18,
               "name": "Liga A",
               "type": "League",
               "logo": "https://media.api-sports.io/basketball/leagues/18.png",
               "country": {
                 "id": 6,
                 "name": "Argentina",
                 "code": "AR",
                 "flag": "https://media.api-sports.io/flags/ar.svg"
               }.with_indifferent_access.with_indifferent_access,
               "seasons": [
                       {
                         "season": "2019-2020",
                         "start": "2019-11-10",
                         "end": "2020-04-30"
                       }.with_indifferent_access,
                       {
                         "season": "2018-2019",
                         "start": "2018-12-05",
                         "end": "2019-05-28"
                       }.with_indifferent_access,
                       {
                         "season": "2017-2018",
                         "start": "2017-11-29",
                         "end": "2018-06-23"
                       }.with_indifferent_access,
                       {
                         "season": "2016-2017",
                         "start": "2016-09-23",
                         "end": "2017-07-16"
                       }.with_indifferent_access,
                       {
                         "season": "2021-2022",
                         "start": "2021-11-03",
                         "end": "2022-03-13"
                       }.with_indifferent_access,
                       {
                         "season": "2020-2021",
                         "start": "2020-11-04",
                         "end": "2021-05-15"
                       }.with_indifferent_access
                     ]
             }.with_indifferent_access,
             {
               "id": 179,
               "name": "Super 4",
               "type": "cup",
               "logo": "https://media.api-sports.io/basketball/leagues/179.png",
               "country": {
                 "id": 6,
                 "name": "Argentina",
                 "code": "AR",
                 "flag": "https://media.api-sports.io/flags/ar.svg"
               }.with_indifferent_access,
               "seasons": [
                       {
                         "season": "2017-2018",
                         "start": "2018-01-06",
                         "end": "2018-01-07"
                       }.with_indifferent_access,
                       {
                         "season": "2016-2017",
                         "start": "2017-01-06",
                         "end": "2017-01-08"
                       }.with_indifferent_access,
                       {
                         "season": "2015-2016",
                         "start": "2015-12-22",
                         "end": "2015-12-24"
                       }.with_indifferent_access
                     ]
             }.with_indifferent_access
           ]
end