class AdminsController < ApplicationController
  def index
    @admin = Admin.all
  end

  def show
    @admin = current_admin
  end

  def dashboard
    @admin = current_admin
  end
end
