class UserInfoController < ApplicationController

  def index
    if user_signed_in?
      @jobs = current_user.watching_jobs.order(:created_at).paginate(page: params[:page])
      @possible_jobs = Job.all.order(created_at: :desc).take(5)
    end
  end

  def show
    @user = User.where('LOWER(username) = ?', params[:username].downcase).first

    if !@user
      redirect_to root_path
    else
      if @user.is_employer
        @jobs = @user.jobs.order(created_at: :desc)
        @job = Job.new
      else
        @works = @user.works.order(:title)
        @work = Work.new
      end
    end
  end

end
