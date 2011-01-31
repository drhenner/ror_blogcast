class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy#, :as => :commentable
  has_many :spams, :dependent => :destroy

  validates_presence_of :title, :content

  attr_accessible :title, :content, :markdown, :author, :commentable

  def to_param
    #1st: Removes all non alphanumeric characters from the string.
    #2nd: No more than one of the separator in a row.
    #3rd: Remove leading/trailing separator.
    "#{id}-#{title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end

  # Creates a new post from a draft
  #
  # param[Draft]
  # return[Boolean]
  def self.create_from_draft(draft)
      post = Post.new(
                 :title       =>  draft.title,
                 :markdown    =>  draft.markdown,
                 :content     =>  draft.content,
                 :author      =>  draft.author,
                 :commentable =>  true,
                 :posted_at   =>  Time.now
              )

      post.save ? post : false
  end
end
