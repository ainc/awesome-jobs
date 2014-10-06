class ContactController < ApplicationController

  before_filter :authenticate_user!

  def contact_page
    if params[:username]
      @user = User.where('LOWER(username) = ?', params[:username].downcase).first
    end

    if !@user or @user == current_user
      redirect_to root_path
    end
  end

  def send_contact_request
    @errors = []
    can_send = true
    if params[:message]
      @message = params[:message].strip
    end
    if params[:username]
      @user = User.where('LOWER(username) = ?', params[:username].downcase).first
    end

    if @message and @message.blank?
      @errors << I18n.t('message_cant_be_blank')
      @message_failed = true
      can_send = false
    end
    if !verify_recaptcha
      @errors << I18n.t('recaptcha_error')
      can_send = false
    end

    if can_send and @user and @user != current_user
      ContactMailer.contact_form(current_user, @user, @message).deliver
      redirect_to root_path, notice: I18n.t('message_sent')
    else
      if @user
        render :contact_page
      else
        redirect_to root_path
      end
    end
  end

end
