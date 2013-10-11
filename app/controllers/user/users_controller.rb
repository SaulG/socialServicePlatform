class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update]
    before_filter :correct_user, only: [:edit, :update]
    def create
        p params
        @user = User.new(params[:user])
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to the Social Service Platform"
            redirect_to @user
        else
            @role = @user.role
            render 'new'
        end
    end
    def new
        if (params[:role] == 'student') or (params[:role] == 'attendant')
            @user = User.new()
            @role = params[:role]
        else
            redirect_to root_path
        end
    end
    def show
        @user = User.find(params[:id])
    end
    def edit
        
    end

    def update
        if @user.update_attributes(params[:user])
            flash[:success] = "Profile updated"
            sign_in @user
            redirect_to @user
        else
            render 'edit'
        end
    end
    private
    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please sign in."
        end
    end
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
