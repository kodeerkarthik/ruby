class ManageUserController < ApplicationController
  load_and_authorize_resource :class => ManageUserController

  def index
    @users = User.all
    @articles = Article.all
  end
end
