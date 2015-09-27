class UserMessageController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create_message
    begin
      user = User.find_by(email: message_params[:email])
      if !user.nil?
        if user[:verified] == true
          message = Message.new(message_params)
          if message.valid?
            if message.save
              render json: {success: 'Message created successfully!'}, :success => true, :status => :ok
            end
          else
            render json: {error: 'Make sure no parameters are null'}, :success => false, :status => :not_acceptable
          end
        else
          render json: {error: 'User email not verified'}, :success => false, :status => :not_found
        end
      else
        render json: {error: 'User email not found'}, :success => false, :status => :not_found
      end
    rescue
      render json: {error: 'Internal Server Error'}, :success => false, :status => :internal_server_error
    end
  end

  def get_message
    if params[:code] == "acae273a5a5c88b46b36d65a25f5f435"
      render json: Message.where(answered: false).order("RANDOM()").first.to_json
    else
      render json: {error: 'Not allowed'}, :success => false, :status => :not_acceptable
    end
  end

  def answer_message
    User.where(verified: true).each do |user|
      NewsLetterSender.send_answer_email(params[:session][:subject], params[:session][:content], user).deliver
    end
    UserNotifier.notify_selected(params[:session][:title],params[:session][:email]).deliver
    message = Message.find_by(email: params[:session][:email], title: params[:session][:title])
    puts params[:session][:email]
    puts params[:session][:title]
    message[:answered] = true
    message.save
    redirect_to :root
  end

  def message_params
    if params[:message]
      params.require(:message).permit(:email, :title, :content)
    else
      message = {}
      message[:email] = params[:email]
      message[:title] = params[:title]
      message[:content] = params[:content]
      return message
    end
  end

end
