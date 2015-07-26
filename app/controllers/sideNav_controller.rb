class SideNavController < ApplicationController
  def index
    @links = SideNav.all
  end
end