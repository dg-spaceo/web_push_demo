class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    @notiy = WebpushNotification.find_or_initialize_by({
      endpoint: params[:endpoint]
    })
    @notiy.assign_attributes({
      auth_key: params[:keys][:auth],
      p256dh_key: params[:keys][:p256dh]
    })
    if @notiy.save
      render json: @notiy
    else
      render json: @notiy.errors.full_messages
    end
  end
end
