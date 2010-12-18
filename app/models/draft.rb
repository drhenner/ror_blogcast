class Draft < ActiveRecord::Base
  validates_presence_of :title, :content
  
  attr_accessible :title, :content, :markdown, :author
  
  def to_param
    #1st: Removes all non alphanumeric characters from the string.
		#2nd: No more than one of the separator in a row.
		#3rd: Remove leading/trailing separator.
    "#{id}-#{title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end
end
