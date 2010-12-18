class ErrorsController < ApplicationController
  layout 'blog'
  def routing
    render_404
  end
end