class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: true, length: { minimum: 4 }
  validates :body, presence: true
  
  def to_param 
    "#{id}-#{title.parameterize}-#{created_at.strftime("%B-%Y")}"
  end
  
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
  
  # splits up tag names and strips them
  # of white space.
  # then removes non-unique tags leaving only 1 copy.
  # find or create tags with names left
  # collect these tags and assign to article.
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
