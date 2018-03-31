require 'rails_helper'

RSpec.describe 'Players API', type: :request do
  let!(:sports) { create_list(:sport, 2)}
  let!(:positions) { create_list(:position, 10)}
  let!(:players) { create_list(:player, 100) }
  let(:player_id) { players.first.id }

  describe 'get /players' do
    before { get '/players' }

    it "returns players" do
      expect(json).not_to be_empty
      expect(json.size).to eq.(100)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /players/:id' do
    before { get "/players/#{player_id}" }

    context "when record exists" do
      it "returns the player" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(player_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when record does not exist" do
      let(:player_id) { 1000 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns not found message" do
        expect(response.body).to match(/Could not find Player/)
      end
    end
  end
end
