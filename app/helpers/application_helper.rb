module ApplicationHelper
  
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class))
    end
  end
  #def textilize(text)
  #  Textilizer.new(text).to_html unless text.blank?
  #end
end
