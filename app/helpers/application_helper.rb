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

end
