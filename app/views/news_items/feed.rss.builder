xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "St. Francis Xavier News Items"
    xml.description "News Items from the St. Francis Xavier web site"
    xml.link news_items_url

    for ni in @news_items
      if (ni.post_at < Time.now) and (ni.expire_at > Time.now)
        xml.item do
          xml.title ni.summary
          xml.description process_markup(ni.story)
          xml.pubDate ni.post_at.to_s(:rfc822)
          xml.link news_item_url(ni)
          xml.guid news_item_url(ni)
        end
      end
    end
  end
end