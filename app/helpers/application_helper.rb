require 'date'

module ApplicationHelper
  
def bulletin_link(date)
  
  while date.wday != 0
    date = date - 1
  end
  
  html = ""
  html << "<a href=\"http://content.seekandfind.com/bulletins/01/1058/"
  html << date.strftime("%Y%m%d")
  html << "B.pdf\" target=\"bulletin\">"
  html << date.strftime("%B %-d, %Y")
  html << "</a>"
  
  return raw(html)
end

def bible_readings_link(date, link_name="Readings for Today")

  html = ""
  html << "<a href=\"http://www.usccb.org/bible/readings/"
  html << date.strftime("%m%d%y")
  html << ".cfm\" target=\"rsite\">#{link_name}</a>"
  
  return raw(html)    
end

def sunday_bible_readings_link(date, link_name="Sunday's Readings")

  while date.wday != 0
    date = date + 1
  end
  
  html = ""
  html << "<a href=\"http://www.usccb.org/bible/readings/"
  html << date.strftime("%m%d%y")
  html << ".cfm\" target=\"rsite\">#{link_name}</a>"
  
  return raw(html)    
end

def display_news(news_item, tag=:h1, truncate=false, picture_size="normal")
  html = ""
  if tag == :h1 then
    html << "<#{tag}>#{news_item.summary}</#{tag}>"
  else
    html << "<#{tag}>#{link_to news_item.summary, news_item}</#{tag}>"
  end
	html << "#{image_tag(news_item.picture.url(picture_size)) if news_item.picture?}"
	if truncate then
	  html << "<p>#{process_markup(news_item.story, true)}"
    html << "#{link_to " ...full story", news_item}"
	else
	  html << "<p>#{process_markup(news_item.story)}"
  end
	html << "</p>"
	# html << "<br />"
	html << "<div class=\"clear\">&nbsp;</div>"

  return raw(html)
end

def process_markup(text, truncate=false)
  t = ""
  in_list = false
  new_line = true
  char_count = 0
  
  #escape markup for raw text before inserting our markup
  text = h(text)
  
  text.each_char { |c|
    case c
    when "*"
      if new_line
        if in_list
          # start a new list item
          t << "<li>"
        else
          # start a new list and a new list item
          t << "<ul>\n<li>"
          in_list = true
        end
      else
        # just echo the *
        t << c
        char_count += 1
      end
      new_line = false
    when "\n"
      if in_list
        # end of list item
        t << "</li>\n"
      else
        t << "<br />\n"
      end
      new_line = true
    else
      if new_line && in_list
        # end the list
        t << "</ul>\n"
        in_list = false
      end
      t << c
      char_count += 1
      new_line = false
    end
    
    if truncate && char_count > 300
      if !in_list && (c == ' ' || c == '\n')
        break
      end
    end
  }
  
  # Bold markup
  t = t.gsub(/''(.*)''/, '<b>\1</b>')  
  
  # Link markup
  t = t.gsub(/\[(.*)\|(.*)\]/, '<a href="\1">\2</a>')
  t = t.gsub(/\[(.*)\]/, '<a href="\1">\1</a>')
  
  # Partial link (from truncation)
  t = t.gsub(/\[(.*)/, '')
  
  return t
end

end
