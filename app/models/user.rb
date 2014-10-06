require 'file_size_validator' 
class User < ActiveRecord::Base

  attr_accessor :login

  before_validation :preval

  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :watchings, dependent: :destroy
  has_many :watching_jobs, through: :watchings, source: :job

  validate :good_password 

  validates :username, length: {minimum: 3, maximum: 15}, :uniqueness => {
    :case_sensitive => false
  }, format: /\A[_\.A-Za-z0-9]+\Z/

  validates :name, length: { minimum: 5, maximum: 40 }
  validates :company, length: { maximum: 40 }
  validates :description, length: { maximum: 500 }
  validates :address, length: { maximum: 40 }
  validates :phone, length: { maximum: 20 }
  validates :website, length: { maximum: 100 }

  validates :avatar, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    } 

  validates :resume, 
    :file_size => { 
      :maximum => 1.megabytes.to_i 
    } 

  def self.noncaptcha_attempts
    3
  end

  private
    def preval
      if self.name
        self.name = self.name.strip
      end

      if self.company
        self.company = self.company.strip
      end

      if self.description
        self.description = self.description.strip
      end

      if self.address
        self.address = self.address.strip
      end

      if self.phone
        self.phone = self.phone.strip
      end

      if self.website
        self.website = self.website.strip.delete(' ')
        if !self.website.blank?
          if !self.website.start_with?('http://') and !self.website.start_with?('https://') and !self.website.start_with?('www.')
            self.website = 'http://' + self.website
          end
        end
      end
    end

    def good_password
      if password_confirmation and password_confirmation.length > 0 and password_confirmation.blank?
        errors.add(:password, 'No es bueno.')
      end
    end

    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

end
