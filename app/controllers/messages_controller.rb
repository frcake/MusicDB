class MessagesController < ApplicationController
  # before_action :authenticate_user!

  def new
    # @user = User.find_by(id: params[:recipient_id])
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
    # @classified = Classified.find_by(id: params[:classified_id])
  end

  def name
    username
  end

  def mailboxer_email(_object)
    email
  end

  def create
    byebug
    recipients = User.find_by(id: params[:recipient_id])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = 'Message has been sent!'
    # NotifierMailer.welcome_email(@user).deliver_later
    redirect_to conversation_path(conversation)
  end
end
