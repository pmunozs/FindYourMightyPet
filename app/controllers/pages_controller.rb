class PagesController < ApplicationController
  def home
    @creatures = Creature.all
  end

  def about
  end
end
