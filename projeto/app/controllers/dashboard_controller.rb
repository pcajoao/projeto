class DashboardController < ApplicationController 
 
    authorize_resource :class => false
    before_action :authenticate_user!  
    
    def index

        @categories = Category.all

        if params[:category_id].present?
            @products = Product.where(cat_id: params[:category_id])
        else
            @products = Product.all
        end
    end

end
