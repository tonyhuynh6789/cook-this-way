require './config/environment'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, ENV['SESSION_KEY'] || 'CAbo7bFkcNVh7MEjXPK)[agfkvRJv'
  end

  get '/' do
    if !session[:user_id]
      erb :index
    else
      @user = User.find(session[:user_id])
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end