class WelcomeController < ApplicationController
  def index
    @current_user
    puts "in welcome controller"
  end

  def show
  	#p @current_user
  	render json: { current_user: current_user }
  end

  def user
  	p @current_user
  	render json: { current_user: current_user }
  end
end
