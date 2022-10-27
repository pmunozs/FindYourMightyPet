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

  def show
    @creature = Creature.find(params[:id])
  end

  def destroy
    Creature.destroy
    redirect_to creatures_path
  end

  def adopt
    @user = current_user
    @creature = Creature.find(params[:creature_id])
    @creature.user = @user
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :age, :ability, :description)
  end
end
