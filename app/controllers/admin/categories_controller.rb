class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USER_NAME"], password: ENV["ADMIN_PASSWORD"]

  def index
  end

  def new
  end

  def create
  end
end
