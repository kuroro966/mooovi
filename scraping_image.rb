require 'mechanize'

def getimage(a_url)
  agent2 = Mechanize.new
  page2 = agent2.get("http://review-movie.herokuapp.com/#{a_url}")
  ele2 = page2.at('.entry-content img')
  puts ele2.get_attribute('src')
end



urls=[]
agent = Mechanize.new
current_page = agent.get("http://review-movie.herokuapp.com/")
elements = current_page.search('.entry-title a')
elements.each do |ele|
  urls << ele.get_attribute('href')
  
end

urls.each do |url|
  getimage(url)
end
