class MessageController < ApplicationController
    before_action :set_community

  def index
    messages = @community.messages
    render json: messages
  end

  def create
    message = @community.messages.build(message_params)
    message.user = User.find(params[:user_id])  # 送信ユーザーを設定

    if message.save
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
