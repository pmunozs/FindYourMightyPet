class PagesController < ApplicationController
  def home
    @creatures = Creature.all
  end

  def about
  end

 
  def my_profile
    @creatures = Creature.where(user: current_user)
    @adopted_creatures = Creature.where(adopted: "adopted")
  end
end
