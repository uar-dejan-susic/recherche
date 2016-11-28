module Admin
  class DashboardController < ApplicationController
    def index
      @options = Option.all
    end
  end
end