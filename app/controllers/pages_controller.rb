class PagesController < ApplicationController
  def home
    @creatures = Creature.all
  end
end
