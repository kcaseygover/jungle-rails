class ReviewsController < ApplicationController

  def show
    @review = Reviews.find(:all)

    respond_to do |format|
      format.html
      format.xml { render "xml => @reviews"}

  end

end
