module Admin
  class PeopleController < ApplicationController
    def index
      @people = Person.all
    end
  end
end
