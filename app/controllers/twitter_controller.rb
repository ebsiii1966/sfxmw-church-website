class TwitterController < ApplicationController

  # GET /twitter
  # GET /twitter.xml
  def new
    logger.info "*** twitter#new"
    @tweet = String.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # POST /twitter
  # POST /twitte.xml
  def create
    logger.info "*** twitter#create"
    @tweet = String.new(params[:tweet])
    logger.info "*** Status is #{@tweet}"
    respond_to do |format|
      if send_tweet(@tweet)
        format.html { redirect_to :action => "new", :notice => "success" }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { redirect_to :action => "new", :notice => "failure"}
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /twitterbatch
  # GET /twitterbatch.xml
  def batch
    logger.info "*** twitter#batch"
    
    @news_items = NewsItem.order("post_at DESC").current.tweet    
    @news_items.each do |news_item|
      send_news_tweet(news_item)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end
  
  def send_news_tweet(news_item)
    status = news_item.summary + ": " + polymorphic_url(news_item)
    if (send_tweet(status))
      news_item.twitter_flag = true
      news_item.save
    end
  end
  
  def send_tweet(status)

    success = false
    
    Twitter.configure do |config|
      config.consumer_key = 'ea8rEJeDmDO3PLSp3JsQ'
      config.consumer_secret = 'Fd0LM7jf3TQw6QgSIfVbzNfIHwNuBwS3D3nPwOScQ'
      config.oauth_token = '514496369-HAVpuwMgIuXFoSZyhPDuFm7RIAq2zd27patnHIz0'
      config.oauth_token_secret = 'NsWTHdhSn4J7tPSqCCkZzXH06MxpYQCC5PgRl0WvFew'
    end
    
    # Twitter.configure do |config|
    #   config.consumer_key = YOUR_CONSUMER_KEY
    #   config.consumer_secret = YOUR_CONSUMER_SECRET
    #   config.oauth_token = YOUR_OAUTH_TOKEN
    #   config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
    # end
    
    begin  
      Twitter.update(status)
    rescue
      success = false
    else 
      success = true  
    end
    
    success
  end
  
end
