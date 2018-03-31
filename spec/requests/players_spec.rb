require 'rails_helper'

RSpec.describe 'Players API', type: :request do
  let!(:sports) { create_list(:sport, 2)}
  let!(:positions) { create_list(:position, 10)}
  let!(:players) { create_list(:player, 100) }
  let(:player_id) { players.first.id }
  let(:sport_title) { sports.first.title }
  let(:sport_player_count) { sports.first.players.count }

  describe 'get /players' do
    before { get '/players' }

    it "returns all players" do
      expect(json).not_to be_empty
      expect(json.size).to be(100)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /players/:id' do

    context "when player exists" do
      it "returns the player" do
        get "/players/#{player_id}"

        expect(json).not_to be_empty
        expect(json['id']).to eq(player_id)
      end

      it "returns status code 200" do
        get "/players/#{player_id}"

        expect(response).to have_http_status(200)
      end
    end

    context "when record does not exist" do
      it "raises error" do
        expect do
          get "/players/1000"
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'get /players?sport=' do

    context "when sport exists" do

      it "returns all players of that sport" do
        get "/players?sport=#{sport_title}"
        expect(json).not_to be_empty
        expect(json.size).to eq(sport_player_count)
      end

      it "returns status code 200" do
        get "/players?sport=#{sport_title}"
        expect(response).to have_http_status(200)
      end
    end

    context "when sport does not exist" do
      it "raises error" do
        expect do
          get "/players?sport=baseketsball"
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
