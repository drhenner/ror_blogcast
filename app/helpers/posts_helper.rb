module PostsHelper
  def description(content)
    sanitize(content.gsub(/<code[^<]*<\/code>/, ""), :tags => %w(), :attributes => %w()).gsub(/[\r\n?]/, " ").squeeze(" ").gsub(/\"/, "'")[0..250].strip
  end
end
