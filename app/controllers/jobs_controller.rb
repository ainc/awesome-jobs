class JobsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def show
    @job = Job.where(id: params[:id]).first

    if !@job
      redirect_to root_path
    elsif user_signed_in?
      @watching = Watching.where(user: current_user, job: @job).first
    end
  end

  def edit
    @job = Job.where(user: current_user, id: params[:id]).first

    if !@job
      redirect_to show_user_path(username: current_user.username)
    end
  end

  def create
    if params[:job]
      j = Job.new(title: params[:job][:title], description: params[:job][:description], url: params[:job][:url], user: current_user)

      respond_to do |format|
        if current_user.is_employer and j.save
          format.html { redirect_to show_job_path(id: j.id) }
          format.js { @vals = {success: true, url: show_user_path(username: current_user.username) } }
        else
          format.html { redirect_to show_user_path(username: current_user.username) }
          format.js { @vals = {success: false, job: j} }

        end
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    j = Job.where(user: current_user, id: params[:id]).first

    respond_to do |format|
      if j and j.destroy
        format.html { redirect_to show_user_path(username: current_user.username) }
      else
        format.html { redirect_to show_user_path(username: current_user.username) }
      end
    end
  end

  def update
    j = Job.where(user: current_user, id: params[:id]).first

    respond_to do |format|
      if params[:job] and j and j.update(title: params[:job][:title], description: params[:job][:description], url: params[:job][:url])
        format.html { redirect_to show_user_path(username: current_user.username) }
        format.js { @vals = { success: true, url: show_user_path(username: current_user.username) } }
      else
        format.html { redirect_to show_user_path(username: current_user.username) }
        format.js { @vals = { success: false, job: j } }
      end
    end
  end

end
