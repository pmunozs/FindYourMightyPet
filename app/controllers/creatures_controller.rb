class CreaturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)
    if @creature.save
      redirect_to creatures_path
    else 
      puts "Fatal error my friend"    
    end
  end

  def destroy
    Creature.destroy
    redirect_to creatures_path 
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :age, :ability, :description)
  end

end
