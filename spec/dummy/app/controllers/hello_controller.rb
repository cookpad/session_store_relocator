class HelloController < ApplicationController
  def create
    session[:hello_message] = params[:message].to_s

    render json: session.to_hash, status: :created
  end

  def show
    render json: session.to_hash
  end

  def destroy
    reset_session

    render json: session.to_hash
  end
end
