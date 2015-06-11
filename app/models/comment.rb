class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true, length: { minimum: 4 }
  validates :body, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false})
            
            
  
end
