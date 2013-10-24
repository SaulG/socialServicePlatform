class DependenciesController < ApplicationController
  def create
      @dependency = Dependency.new(params[:dependency])
      if @dependency.save
          redirect_to root_path
          flash[:notice] = "La dependencia ha sido creada exitasamente."
      else
          render 'new'
      end
  end

  def edit
      @dependency = Dependency.find(params[:id])
  end

  def show
      @dependency = Dependency.find(params[:id])
  end

  def update
      @dependency =  Dependency.find(params[:id])
      if @dependency.update_attributes(params[:dependency])
          flash[:success] = "La informacion de la dependencia ha sido actualizada."
          redirect_to root_path
      else
          render 'edit'
      end
  end

  def destroy
  end

  def new
      @dependency = Dependency.new()
      @dependency.build_dependency_address
  end
end
