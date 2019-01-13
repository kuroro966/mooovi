class Scraping
  
  def self.movie_urls
    links=[]
    agent=Mechanize.new
    next_url=""
    
    while true do
    
      current_page=agent.get('http://review-movie.herokuapp.com/'+next_url)
      elements=current_page.search('.entry-title a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end
      
      next_link=current_page.at('.pagination .next a')
      break unless next_link
      next_url=next_link.get_attribute('href')
    
    end
    
    links.each do |link|
      get_product("http://review-movie.herokuapp.com/#{link}")
    end
    
  end
  
  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    movie_name = page.at('.entry-title').inner_text
    movie_url = page.at('.entry-content img').get_attribute("src") if page.at('.entry-content img')
   
    movie_open_date = page.at('.date span').inner_text if page.at('.date span')
    movie_director = page.at('.director span').inner_text if page.at('.director span')
    movie_detail = page.at('.entry-content p').inner_text if page.at('.entry-content p')
    
    #Products.create(title: movie_name, image_url: movie_url)
    #product = Product.new(title: movie_name, image_url: movie_url)
    product = Product.where(title: movie_name, image_url: movie_url).first_or_initialize #first_or_initializeでwhereと一致があればレコードを返しなければnewする
    
    product.open_date = movie_open_date
    product.director = movie_director
    product.detail = movie_detail

    product.save
    
    
    

    
  end
  
  
  
  
end