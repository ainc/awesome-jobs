class BrowseController < ApplicationController

  def programmers
    @users = User.where(is_employer: false).order(:name).paginate(page: params[:page])
  end

  def employers
    @users = User.where(is_employer: true).order(:name).paginate(page: params[:page])
  end

  def programmer_search
    @q = params[:q]

    if @q and !@q.blank?
      @q = @q.strip
      @users = User.where(is_employer: false).where("LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)", "%#{@q}%", "%#{@q}%").order(created_at: :desc).paginate(page: params[:page])
    else
      redirect_to show_programmers_path
    end
  end

  def employer_search
    @q = params[:q]

    if @q and !@q.blank?
      @q = @q.strip
      @users = User.where(is_employer: false).where("LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?) OR LOWER(company) LIKE LOWER(?)", "%#{@q}%", "%#{@q}%", "%#{@q}%").order(created_at: :desc).paginate(page: params[:page])
    else
      redirect_to show_employers_path
    end
  end

  def jobs
    @jobs = Job.all.order(created_at: :desc).paginate(page: params[:page])
  end

  def job_search
    @q = params[:q]

    if @q and !@q.blank?
      @q = @q.strip
      @jobs = Job.where("LOWER(title) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)", "%#{@q}%", "%#{@q}%").order(created_at: :desc).paginate(page: params[:page])
    else
      redirect_to show_programmers_path
    end
  end

end
