class SiteController < ApplicationController

  def index
  end

  def about
  end

  def contact
  end

  def safe_shopping
<<<<<<< HEAD
=======
  end

  def delivery_returns
  end

  def privacy_policy
>>>>>>> 3b2aca57d1ff0de88236d44881cdb2f2a8a6ed52
  end

  def delivery_returns
  end

  def privacy_policy
  end

  def thank_you
    
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
