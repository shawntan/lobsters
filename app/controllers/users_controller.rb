class UsersController < ApplicationController
  def show
    @showing_user = User.find_by_username!(params[:id])
    @title = "User #{@showing_user.username}"
  end

  def tree
    @title = "Users"
    @tree = User.first.to_tree

	@tree
  end
end
