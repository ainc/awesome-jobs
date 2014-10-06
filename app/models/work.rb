class Work < ActiveRecord::Base

  before_validation :preval

  belongs_to :user

  validates :title, presence: :true, length: { maximum: 50 }
  validates :description, presence: :true, length: { maximum: 400 }
  validates :url, presence: :true, length: { maximum: 100 }

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


end
