class AdminController < ApplicationController
  def index
  end
  
  def style_a
    session[:style] = 'a'
    render :index
  end
  
  def style_b
    session[:style] = 'b'
    render :index
  end
  
  def style_c
    session[:style] = 'c'
    render :index
  end

end
