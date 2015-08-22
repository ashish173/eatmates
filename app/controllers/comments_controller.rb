class Api::V1::CommentsController < ApplicationController
  def create
    reservation = Reservation.find(params[:reservation_id])
    comment = reservation.comments.new(
      message: params[:comment][:message], 
      user: current_user
      )
    if comment.save
      render json: { comment: comment }
    else
      render json: { message: "Comment creation failed" }
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
  end
end
