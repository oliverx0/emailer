class UserSubscriptionController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create_user
    begin
      user = User.find_by(email: user_params[:email])
      if user.nil?
        user = User.new(user_params)
        user[:confirm_code] = SecureRandom.hex(32)
        if user.valid?
          if user.save
            render json: {success: 'User created successfully!'}, :success => true, :status => :ok
          end
        else
          render json: {error: 'Make sure no parameters are null'}, :success => false, :status => :not_acceptable
        end
      elsif user.verified == true
        render json: {error: 'User already exists'}, :success => false, :status => :conflict
      else
        user[:confirm_code] = SecureRandom.hex(32)
        user.save
        render json: {success: 'Confirmation Code Resent'}, :success => true, :status => :ok
      end
    rescue
      render json: {error: 'Internal Server Error'}, :success => false, :status => :internal_server_error
    end
  end

  def confirm_user
    user = User.find_by(email: params[:email])
    @confirmed = false
    if !user.nil?
      if user[:verified] == false
        if user[:confirm_code] == params[:confirm_code]
          user[:verified] = true
          user.save
          @confirmed = true
        end
      else
        @confirmed = true
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
