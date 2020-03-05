class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    only_admin
    @package = Package.new
  end

  def edit
    only_admin
    @package = Package.find(params[:id])
  end

  def create
    @package = Package.new(package_params)

    if @package.save
      redirect_to @package
    else
      render 'new'
    end
  end

  def update
    @package = Package.find(params[:id])

    if @package.update(package_params)
      redirect_to @package
    else
      render 'edit'
    end
  end

  def destroy
    only_admin
    @package = Package.find(params[:id])
    @package.destroy

    redirect_to packages_path
  end


  private
    def package_params
      params.require(:package).permit(:provider, :name, :description, :price, :sort, :logo)
    end
end
