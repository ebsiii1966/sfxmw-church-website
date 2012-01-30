class HomeController < ApplicationController
  def index
    @news_items = NewsItem.first
  end

end
