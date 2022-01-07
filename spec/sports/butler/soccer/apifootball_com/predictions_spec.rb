# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Predictions do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :predictions }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_predictions_apifootball_com
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_array', 86392,
                    :response_predictions_all_apifootball_com, :parsed_response
  end
end

def stubs_predictions_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_predictions&id=86392")
    .to_return(status: 200, body: get_mocked_response('predictions.json', sport, api_name))
end

def response_predictions_all_apifootball_com
  [
    {
      "match_id": "86392",
      "country_id": "6",
      "country_name": "Spain",
      "league_id": "302",
      "league_name": "La Liga",
      "match_date": "2021-05-16",
      "match_status": "Finished",
      "match_time": "18:30",
      "match_hometeam_id": "7275",
      "match_hometeam_name": "Deportivo Alavés",
      "match_hometeam_score": "4",
      "match_awayteam_name": "Granada",
      "match_awayteam_id": "151",
      "match_awayteam_score": "2",
      "match_hometeam_halftime_score": "",
      "match_awayteam_halftime_score": "",
      "match_hometeam_extra_score": "",
      "match_awayteam_extra_score": "",
      "match_hometeam_penalty_score": "",
      "match_awayteam_penalty_score": "",
      "match_hometeam_system": "4-4-2",
      "match_awayteam_system": "4-2-3-1",
      "match_live": "0",
      "prob_HW": "39.00",
      "prob_D": "25.00",
      "prob_AW": "36.00",
      "prob_HW_D": "64.00",
      "prob_AW_D": "61.00",
      "prob_HW_AW": "75.00",
      "prob_O": "56.00",
      "prob_U": "44.00",
      "prob_O_1": "79.00",
      "prob_U_1": "21.00",
      "prob_O_3": "34.00",
      "prob_U_3": "66.00",
      "prob_bts": "59.00",
      "prob_ots": "41.00",
      "prob_ah_h_45": "100.00",
      "prob_ah_a_45": "0.00",
      "prob_ah_h_35": "98.00",
      "prob_ah_a_35": "2.00",
      "prob_ah_h_25": "94.00",
      "prob_ah_a_25": "6.00",
      "prob_ah_h_15": "83.00",
      "prob_ah_a_15": "17.00",
      "prob_ah_h_05": "64.00",
      "prob_ah_a_05": "36.00",
      "prob_ah_h_-05": "39.00",
      "prob_ah_a_-05": "61.00",
      "prob_ah_h_-15": "19.00",
      "prob_ah_a_-15": "81.00",
      "prob_ah_h_-25": "7.00",
      "prob_ah_a_-25": "93.00",
      "prob_ah_h_-35": "2.00",
      "prob_ah_a_-35": "98.00",
      "prob_ah_h_-45": "1.00",
      "prob_ah_a_-45": "99.00"
    }.with_indifferent_access
  ]
end
