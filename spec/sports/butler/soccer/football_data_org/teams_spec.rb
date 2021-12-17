# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Teams do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :teams }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_teams_football_data_org
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 18,
                    :response_team_one_football_data_org, :stringify_keys
  end
end

def stubs_teams_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams/18")
    .to_return(status: 200, body: get_mocked_response('team.json', sport, api_name))
end

def response_team_one_football_data_org
  {
    "id": 18,
    "area": {
      "id": 2088,
      "name": "Germany"
    }.with_indifferent_access,
    "activeCompetitions": [
            {
              "id": 2002,
              "area": {
                "id": 2088,
                "name": "Germany"
              }.with_indifferent_access,
              "name": "Bundesliga",
              "code": "BL1",
              "plan": "TIER_ONE",
              "lastUpdated": "2021-03-22T01:20:06Z"
            }.with_indifferent_access,
            {
              "id": 2011,
              "area": {
                "id": 2088,
                "name": "Germany"
              }.with_indifferent_access,
              "name": "DFB-Pokal",
              "code": "DFB",
              "plan": "TIER_TWO",
              "lastUpdated": "2021-03-04T02:35:04Z"
            }.with_indifferent_access,
            {
              "id": 2001,
              "area": {
                "id": 2077,
                "name": "Europe"
              }.with_indifferent_access,
              "name": "UEFA Champions League",
              "code": "CL",
              "plan": "TIER_ONE",
              "lastUpdated": "2021-03-18T03:00:04Z"
            }.with_indifferent_access
          ],
    "name": "Borussia Mönchengladbach",
    "shortName": "M'gladbach",
    "tla": "BMG",
    "crestUrl": "https://crests.football-data.org/18.svg",
    "address": "Hennes-Weisweiler-Allee 1 Mönchengladbach 41179",
    "phone": "+49 (02161) 92930",
    "website": "http://www.borussia.de",
    "email": "info@borussia.de",
    "founded": 1900,
    "clubColors": "Black / White / Green",
    "venue": "Stadion im Borussia-Park",
    "squad": [
            {
              "id": 3176,
              "name": "Matthias Ginter",
              "position": "Defender",
              "dateOfBirth": "1994-01-19T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 3185,
              "name": "Lars Stindl",
              "position": "Midfielder",
              "dateOfBirth": "1988-08-26T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 3470,
              "name": "Yann Sommer",
              "position": "Goalkeeper",
              "dateOfBirth": "1988-12-17T00:00:00Z",
              "countryOfBirth": "Switzerland",
              "nationality": "Switzerland",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 3473,
              "name": "Michael Lang",
              "position": "Defender",
              "dateOfBirth": "1991-02-08T00:00:00Z",
              "countryOfBirth": "Switzerland",
              "nationality": "Switzerland",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 3475,
              "name": "Nico Elvedi",
              "position": "Defender",
              "dateOfBirth": "1996-09-30T00:00:00Z",
              "countryOfBirth": "Switzerland",
              "nationality": "Switzerland",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 3483,
              "name": "Breel Embolo",
              "position": "Attacker",
              "dateOfBirth": "1997-02-14T00:00:00Z",
              "countryOfBirth": "Cameroon",
              "nationality": "Switzerland",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6563,
              "name": "Valentino Lazaro",
              "position": "Midfielder",
              "dateOfBirth": "1996-03-24T00:00:00Z",
              "countryOfBirth": "Austria",
              "nationality": "Austria",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6599,
              "name": "Torben Müsel",
              "position": "Midfielder",
              "dateOfBirth": "1999-07-25T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6667,
              "name": "Tobias Sippel",
              "position": "Goalkeeper",
              "dateOfBirth": "1988-03-22T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6669,
              "name": "Oscar Wendt",
              "position": "Defender",
              "dateOfBirth": "1985-10-24T00:00:00Z",
              "countryOfBirth": "Sweden",
              "nationality": "Sweden",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6670,
              "name": "Tony Jantschke",
              "position": "Defender",
              "dateOfBirth": "1990-04-07T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6672,
              "name": "Mamadou Doucouré",
              "position": "Defender",
              "dateOfBirth": "1998-05-21T00:00:00Z",
              "countryOfBirth": "Senegal",
              "nationality": "France",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6678,
              "name": "Louis Beyer",
              "position": "Defender",
              "dateOfBirth": "2000-05-19T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6679,
              "name": "Ibrahima Traoré",
              "position": "Midfielder",
              "dateOfBirth": "1988-04-21T00:00:00Z",
              "countryOfBirth": "France",
              "nationality": "Guinea",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6680,
              "name": "Patrick Herrmann",
              "position": "Midfielder",
              "dateOfBirth": "1991-02-12T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6681,
              "name": "Jonas Hofmann",
              "position": "Midfielder",
              "dateOfBirth": "1992-07-14T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6682,
              "name": "Christoph Kramer",
              "position": "Midfielder",
              "dateOfBirth": "1991-02-19T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6687,
              "name": "Denis Zakaria",
              "position": "Midfielder",
              "dateOfBirth": "1996-11-20T00:00:00Z",
              "countryOfBirth": "Switzerland",
              "nationality": "Switzerland",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 6694,
              "name": "Julio Villalba",
              "position": "Attacker",
              "dateOfBirth": "1998-09-11T00:00:00Z",
              "countryOfBirth": "Paraguay",
              "nationality": "Paraguay",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 8443,
              "name": "Alassane Pléa",
              "position": "Attacker",
              "dateOfBirth": "1993-03-10T00:00:00Z",
              "countryOfBirth": "France",
              "nationality": "France",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 8685,
              "name": "Marcus Thuram-Ulien",
              "position": "Attacker",
              "dateOfBirth": "1997-08-06T00:00:00Z",
              "countryOfBirth": "Italy",
              "nationality": "France",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 8805,
              "name": "Ramy Bensebaini",
              "position": "Defender",
              "dateOfBirth": "1995-04-16T00:00:00Z",
              "countryOfBirth": "Algeria",
              "nationality": "Algeria",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 9410,
              "name": "Max Grün",
              "position": "Goalkeeper",
              "dateOfBirth": "1987-04-05T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 9522,
              "name": "Florian Neuhaus",
              "position": "Midfielder",
              "dateOfBirth": "1997-03-16T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 15109,
              "name": "Hannes Wolf",
              "position": "Midfielder",
              "dateOfBirth": "1999-04-16T00:00:00Z",
              "countryOfBirth": "Austria",
              "nationality": "Austria",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 15111,
              "name": "Marco Rose",
              "position": "null",
              "dateOfBirth": "1976-09-11T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "COACH"
            }.with_indifferent_access,
            {
              "id": 16338,
              "name": "Stefan Lainer",
              "position": "Defender",
              "dateOfBirth": "1992-08-27T00:00:00Z",
              "countryOfBirth": "Austria",
              "nationality": "Austria",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 82442,
              "name": "Joseph Scally",
              "position": "Defender",
              "dateOfBirth": "2002-12-31T00:00:00Z",
              "countryOfBirth": "United States",
              "nationality": "United States",
              "shirtNumber": 25,
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 97458,
              "name": "Jan Jakob Olschowsky",
              "position": "Goalkeeper",
              "dateOfBirth": "2001-11-18T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 122645,
              "name": "Kaan Kurt",
              "position": "Midfielder",
              "dateOfBirth": "2001-12-21T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 143074,
              "name": "Famana Quizera",
              "position": "Midfielder",
              "dateOfBirth": "2002-04-25T00:00:00Z",
              "countryOfBirth": "Guinea-Bissau",
              "nationality": "Portugal",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access,
            {
              "id": 150517,
              "name": "Rocco Reitz",
              "position": "Midfielder",
              "dateOfBirth": "2002-05-29T00:00:00Z",
              "countryOfBirth": "Germany",
              "nationality": "Germany",
              "shirtNumber": "null",
              "role": "PLAYER"
            }.with_indifferent_access
          ],
    "lastUpdated": "2020-11-26T02:04:29Z"
  }.with_indifferent_access
end
