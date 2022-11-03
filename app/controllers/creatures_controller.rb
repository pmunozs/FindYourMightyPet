class CreaturesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @creatures = Creature.search_by_name_and_description(params[:query])
    else
      @creatures = Creature.all
    end
    @markers = @creatures.geocoded.map do |creature|
      {
        lat: creature.latitude,
        lng: creature.longitude
      }
    end
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.user = current_user
    if @creature.save
      redirect_to creatures_path
    else
      puts "Fatal error my friend"
    end
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def edit
    @creature = Creature.find(params[:id])
    if @creature.user == current_user
    else
      puts "Can't do that"
      redirect_to creatures_path
    end
  end

  def update
    @creature = Creature.find(params[:id])
    @creature.update(creature_params)
    redirect_to creature_path(@creature)
  end

  def destroy
    @creature = Creature.find(params[:id])
    if @creature.user == current_user
      @creature.destroy
      redirect_to creatures_path
    else
      "Can't do that"
    end
  end

  def adopt
    @user = current_user
    @creature = Creature.find(params[:creature_id])
    @creature.user = @user
    @creature.adopted = !@creature.adopted # flop the status
    @creature.save
    if @creature.adopted
      flash[:notice] = "Congatulations on your adoption of #{@creature.name}!"
    end
    redirect_to creature_path(@creature)
  end

  def flop
    creature = Creature.find(params[:id])

  end

  private

  def creature_params
    params.require(:creature).permit(:name, :age, :ability, :description, :photo)
  end

end
