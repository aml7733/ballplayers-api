class PlayersController < ApplicationController
  include ActionController::Serialization

  def index
    if params['sport']
      sport = Sport.find_by(title: params['sport']) or not_found
      @players = sport.players
    else
      @players = Player.all
    end
    render json: PlayerSerializer.mass_serialize(@players)

    #@players.to_json(only: [:id, :name_brief, :first_name, :last_name, :age, :average_position_age_diff], include: [position: { only: [:title, :avg_age]}])

    #
  end

  def show
    @player = Player.find_by(id: params[:id]) or not_found

    render json: PlayerSerializer.serialize(@player)

    #@player.to_json(only: [:id, :name_brief, :first_name, :last_name, :age, :average_position_age_diff], include: [position: { only: [:title, :avg_age]}])
  end
end
