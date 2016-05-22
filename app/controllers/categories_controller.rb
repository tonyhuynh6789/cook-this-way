class CategoriesController < ApplicationController
  get '/categories' do
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    erb :'/categories/index'
  end

  get '/categories/:slug' do
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @category = Category.find_by_slug(params[:slug])
    @cat_page = @category.recipes.paginate(page: params[:page] || 1, per_page: 9)
    erb :'/categories/show_category'
  end
end