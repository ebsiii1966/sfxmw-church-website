class HomeController < ApplicationController
  def index
    @news_items = NewsItem.order("post_at").find_all_by_top_flag(true)
  end
end
