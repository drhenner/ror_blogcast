class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_presence_of :content
  
  include Rakismet::Model
  attr_accessible :name, :email, :website, :content
  rakismet_attrs :author => :name,
                 :author_email => :email,
                 :author_url => :website
  
  def bang(current_user, request)
    #Comment properties business logic
    if current_user
      self.admin = true;
    else
      self.admin = false;
    end

    if self.name.downcase == "name" || self.name.downcase == ""
      self.name = "Anonymous Coward"
    end

    if self.email.downcase == "email"
      self.email = ""
    end

    if self.website.downcase == "website"
      self.website = ""
    end
    
    #Check for spam
    self.comment_type = "comment"
    self.user_ip = request.remote_ip
    self.user_agent = request.user_agent
    self.referrer = request.referrer
    self.permalink = request.referrer
  end
  
  def slice_and_dice(spam)
    self.admin = false
    self.name =  spam.name
    self.email =   spam.email
    self.website =   spam.website
    self.content =     spam.content
    self.comment_type =   spam.comment_type
    self.permalink =   spam.permalink
    self.user_ip =   spam.user_ip
    self.user_agent =   spam.user_agent
    self.referrer =   spam.referrer
  end
end
