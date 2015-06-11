class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings
  
  #override default to_s
  def to_s
    name
  end
end
