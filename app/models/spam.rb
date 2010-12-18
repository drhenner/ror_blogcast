class Spam < ActiveRecord::Base
  belongs_to :post
  
  validates_presence_of :content
  
  include Rakismet::Model
  attr_accessible :name, :email, :website, :content
  rakismet_attrs :author => :name,
                 :author_email => :email,
                 :author_url => :website
  
  def slice_and_dice(comment)
    self.name =  comment.name
    self.email =   comment.email
    self.website =   comment.website
    self.content =     comment.content
    self.comment_type =   comment.comment_type
    self.permalink =   comment.permalink
    self.user_ip =   comment.user_ip
    self.user_agent =   comment.user_agent
    self.referrer =   comment.referrer
  end
end