class ReviewsController < ApplicationController

  # def index
  #   name = params[:name]
  #   @reviews = Review.search(name)
  #   json_response(@reviews)
  # end

  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "This review has been updated successfully."
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: 'This review has been deleted successfully. '
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:author, :content, :destination_id)
  end
end
