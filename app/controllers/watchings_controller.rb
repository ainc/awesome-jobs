class WatchingsController < ApplicationController

  before_filter :authenticate_user!

  def create
    w = Watching.new(user: current_user, job_id: params[:id])

    j = Job.where(id: params[:id]).first

    respond_to do |format|
      if j and w.save
        display = view_context.link_to('<span class="glyphicon glyphicon-eye-close"></span>'.html_safe, destroy_watching_path(id: w.id), class: 'btn btn-lg btn-danger', method: :delete, remote: true)
        format.html { redirect_to show_job_path(id: params[:id]) }
        format.js { @vals = { success: true, display: display } }
      else
        format.html { redirect_to show_job_path(id: params[:id]) }
        format.js { @vals = { success: false} }
      end
    end
  end

  def destroy
    w = Watching.where(user: current_user, id: params[:id]).first

    respond_to do |format|
      if w and w.destroy
        display = view_context.link_to('<span class="glyphicon glyphicon-eye-open"></span>'.html_safe, create_watching_path(id: w.job_id), class: 'btn btn-lg btn-primary', method: :post, remote: true)
        format.html { redirect_to show_user_path(username: current_user.username) }
        format.js { @vals = { success: true, display: display } }
      else
        format.html { redirect_to show_user_path(username: current_user.username) }
        format.js { @vals = { success: false } }
      end
    end
  end

end
