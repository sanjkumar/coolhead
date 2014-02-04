class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    '/myprofile'
  end


  # @return [ensure_admin]
  def ensure_admin
    unless current_user && current_user.admin?
      render :text => 'Access Error Message', :status => :unauthorized
    end
  end

<<<<<<< HEAD
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end


=======
>>>>>>> 3b2aca57d1ff0de88236d44881cdb2f2a8a6ed52
end
