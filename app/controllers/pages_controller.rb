class PagesController < ApplicationController
    def home
      @basic_plan =Plan.find(1) #Allow to get the Plan with this id ( eg BASIC)
      @pro_plan = Plan.find(2) #Allow to get the Plan with this id ( eg PRO)
    end
    
    def about
    end
    
end
