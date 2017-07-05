class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cats_url
    else
        render text: cat.errors.full_messages
    end
  end 

  def new
    render :new
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url
    else
      render text: @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      render text: "Cat with that id does not exist"
    end
  end

  private

  def cat_params

    params.require(:cat).permit(:color, :sex, :name, :birth_date, :description)
  end

end
