class StaticPagesController < ApplicationController
  def about
  end

  def home
      if signed_in?
          redirect_to help_path
      end
  end

  def contact
  end

  def help
  end

end
