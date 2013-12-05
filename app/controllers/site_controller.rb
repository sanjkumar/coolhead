class SiteController < ApplicationController
  def index
   
  end

  def about
  end

  def contact
  end

  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['description LIKE ? OR sub_category LIKE ? OR brand LIKE ?', 
        "%#{ search_query}%", "%#{ search_query}%", "%#{ search_query}%"])
    else
      find(:all)
    end
  end

  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['description LIKE ? OR sub_category LIKE ? OR brand LIKE ?', 
        "%#{ search_query}%", "%#{ search_query}%", "%#{ search_query}%"])
    else
      find(:all)
    end
  end

end
