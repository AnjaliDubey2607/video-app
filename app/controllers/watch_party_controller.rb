class WatchPartyController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_opentok_vars, only: :party

  def home
  end

  def login
    @name = login_params[:name]
    if login_params[:password] == ENV['PARTY_PASSWORD']
      @session_id = WatchParty.create_or_load_session_id
      redirect_to party_path(name: @name)
    else
      redirect_to('/', flash: { error: 'Incorrect password' })
    end

  end

  def party
    
  end

  def leave_call
    session = WatchParty.last
    session.expired = true
    session.save
    redirect_to root_path
  end

  def end_call
    sessions = WatchParty.last
    sessions.destroy
    redirect_to root_path
  end

  private

  def set_opentok_vars
    @api_key = ENV['OPENTOK_API_KEY']
    @api_secret = ENV['OPENTOK_API_SECRET']
    @session_id = WatchParty.find_by(expired: false).session_id
    @moderator_name = ENV['MODERATOR_NAME']
    @name ||= params[:name]
    @token = WatchParty.create_token(@name, @moderator_name, @session_id)
  end

  def login_params
    params.permit(:name, :password, :authenticity_token, :commit)
  end
end
