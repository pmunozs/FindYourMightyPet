class CreaturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def adopt
    @user = current_user
    @creature = Creature.find(params[:creature_id])
    @creature.user = @user
  end
end
