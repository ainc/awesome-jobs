class WorksController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @work = Work.where(user: current_user, id: params[:id]).first

    if !@work
      redirect_to show_user_path(username: current_user.username)
    end
  end

  def create
    if params[:work]
      w = Work.new(user: current_user, title: params[:work][:title], description: params[:work][:description], url: params[:work][:url])

      respond_to do |format|
        if !current_user.is_employer and w.save
          format.html { redirect_to show_user_path(id: current_user.id) }
          format.js { @vals = { success: true, url: show_user_path(username: current_user.username) } }
        else
          format.html { redirect_to show_user_path(username: current_user.username) }
          format.js { @vals = { success: false, work: w } }
        end
      end
    else
      redirect_to root_path
    end
  end

  def update
    w = Work.where(user: current_user, id: params[:id]).first

    respond_to do |format|
      if params[:work] and w and w.update(title: params[:work][:title], description: params[:work][:description], url: params[:work][:url])
        format.html { redirect_to show_user_path(id: current_user.id) }
        format.js { @vals = { success: true, url: show_user_path(username: current_user.username) } }
      else
        format.html { redirect_to show_user_path(username: current_user.username) }
        format.js { @vals = { success: false, work: w } }
      end
    end
  end

  def destroy

    w = Work.where(user: current_user, id: params[:id]).first

    respond_to do |format|
      if w and w.destroy
        format.html { redirect_to show_user_path(username: current_user.username) }
      else
        format.html { redirect_to show_user_path(username: current_user.username) }
      end
    end


  end
  
end
