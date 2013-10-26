class ConfigurationsController < ApplicationController
    before_filter :correct_configuration, only: [:edit, :update, :show]

    def create
        @configuration = Configuration.new(params[:configuration])
        @configuration.user_id = current_user.id
        if @configuration.save
            redirect_to current_configuration
        else
            render 'new'
        end
    end

    def show
        @configuration = ::Configuration.find_by_user_id(params[:id])
    end

    def update
        @configuration = Configuration.find(params[:id])
        if @configuration.update_attributes(params[:configuration])
            flash[:success] = "La configuracion ha sido actualizada."
            redirect_to current_configuration
        else
            render 'edit'
        end
    end

    def new
        @configuration = ::Configuration.new()
    end

    def edit
        @configuration = ::Configuration.find(current_configuration.id)
        if !@configuration
            @configuration = ::Configuration.new
        end
    end

    private
    def correct_configuration
        @configuration = ::Configuration.find(params[:id])
        redirect_to edit_configuration_path(current_configuration) unless current_configuration?(@configuration)
    end
end
