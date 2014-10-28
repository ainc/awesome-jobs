class Job < ActiveRecord::Base

  before_validation :preval
  before_create :not_too_many

  belongs_to :user

  validates :title, presence: :true, length: { maximum: 50 }
  validates :description, presence: :true, length: { maximum: 1000 }
  validates :url, length: { maximum: 100 }

  private
    def preval
      if self.title
        self.title = self.title.strip
      end

      if self.description
        self.description = self.description.strip
      end

      if self.url
        self.url = self.url.strip.delete(' ')
        if !self.url.blank?
          if !self.url.start_with?('http://') and !self.url.start_with?('https://') and !self.url.start_with?('www.')
            self.url = 'http://' + self.url
          end
        end
      end
    end

    def not_too_many
      count = Job.where(user_id: self.user_id, created_at: 1.hour.ago..DateTime.now).count
      count <= 10
    end


end
