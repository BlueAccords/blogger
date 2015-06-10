class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4 }
  validates :body, presence: true
  
  def to_param 
    "#{id}-#{title.parameterize}-#{created_at.strftime("%B-%Y")}"
  end
end
