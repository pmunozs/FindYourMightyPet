class CreaturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @creatures = Creature.all
  end
end
