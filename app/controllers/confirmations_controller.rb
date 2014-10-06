class ConfirmationsController < Devise::ConfirmationsController

  def new
    if user_signed_in?
      redirect_to root_path
    else
      super
    end
  end

  def create
    if user_signed_in?
      redirect_to root_path
    else
      super
    end
  end
end
