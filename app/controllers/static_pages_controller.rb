class StaticPagesController < ApplicationController
  def new_user
    @user = User.new()
  end

  def new_message
    @message = Message.new()
  end

  def answer_message
    if params[:code] == "acae273a5a5c88b46b36d65a25f5f435"
      @message = Message.where(answered: false).order("RANDOM()").first
      @user = User.find_by(email: @message.email)
    else
      flash[:error] = "Wrong code"
    end
  end


end
