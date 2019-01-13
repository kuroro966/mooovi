require "mechanize"
agent = Mechanize.new

page =  agent.get("https://app-mooovi.herokuapp.com/works/initial_scraping")
elements=page.search("p")
elements.each do |ele|
  text= ele.inner_text
  puts text
end
  
page1 =  agent.get("https://app-mooovi.herokuapp.com/works/first_scraping")
elements1=page1.search("li")
elements1.each do |ele1|
  text1 = ele1.inner_text
  puts text1
end


page2 =  agent.get("https://app-mooovi.herokuapp.com/works/second_scraping")
elements2=page2.search("div div")
elements2.each do |ele2|
  text2= ele2.inner_text
  puts text2
end

page3 =  agent.get("https://app-mooovi.herokuapp.com/works/third_scraping")
elements3=page3.search(".etc div")
elements3.each do |ele3|
  text3= ele3.inner_text
  puts text3
end