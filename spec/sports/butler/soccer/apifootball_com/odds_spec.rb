# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Odds do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :odds }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_odds_apifootball_com
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_from_to', 86392, '2021-05-22', '2021-05-22',
                    :response_odds_all_apifootball_com, :parsed_response
  end
end

def stubs_odds_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/?APIkey=my_dummy_token&action=get_odds&match_id=86392&from=2021-05-22&to=2021-05-22")
    .to_return(status: 200, body: get_mocked_response('odds.json', sport, api_name))
end

def response_odds_all_apifootball_com
  [
    {
      "match_id": "137523",
      "odd_bookmakers": "bwin",
      "odd_date": "2021-04-17 20:26:25",
      "odd_1": "1.67",
      "odd_x": "3.50",
      "odd_2": "4.50",
      "odd_1x": "1.16",
      "odd_12": "1.25",
      "odd_x2": "2.00",
      "ah-4.5_1": "",
      "ah-4.5_2": "",
      "ah-4_1": "",
      "ah-4_2": "",
      "ah-3.5_1": "",
      "ah-3.5_2": "",
      "ah-3_1": "",
      "ah-3_2": "",
      "ah-2.5_1": "",
      "ah-2.5_2": "",
      "ah-2_1": "",
      "ah-2_2": "",
      "ah-1.5_1": "",
      "ah-1.5_2": "",
      "ah-1_1": "",
      "ah-1_2": "",
      "ah0_1": "",
      "ah0_2": "",
      "ah+0.5_1": "",
      "ah+1_1": "",
      "ah+1_2": "",
      "ah+1.5_1": "",
      "ah+1.5_2": "",
      "ah+2_1": "",
      "ah+2_2": "",
      "ah+2.5_1": "",
      "ah+2.5_2": "",
      "ah+3_1": "",
      "ah+3_2": "",
      "ah+3.5_1": "",
      "ah+3.5_2": "",
      "ah+4_1": "",
      "ah+4_2": "",
      "ah+4.5_1": "",
      "ah+4.5_2": "",
      "o+0.5": "",
      "u+0.5": "",
      "o+1": "",
      "u+1": "",
      "o+1.5": "",
      "u+1.5": "",
      "o+2": "",
      "u+2": "",
      "o+2.5": "1.44",
      "u+2.5": "2.60",
      "o+3": "",
      "u+3": "",
      "o+3.5": "2.00",
      "u+3.5": "1.72",
      "o+4": "",
      "u+4": "",
      "o+4.5": "",
      "u+4.5": "",
      "o+5": "",
      "u+5": "",
      "o+5.5": "",
      "u+5.5": "",
      "bts_yes": "1.44",
      "bts_no": "2.60"
    }.with_indifferent_access
  ]
end
