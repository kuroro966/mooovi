require "mechanize"
agent = Mechanize.new

page=agent.get("http://review-movie.herokuapp.com/")

elements = page.search("h2 a")
elements.each do|ele|
title_text=ele.inner_text
puts title_text
end


