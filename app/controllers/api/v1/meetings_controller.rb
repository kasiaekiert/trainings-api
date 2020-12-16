module Api 
  module V1
    class MeetingsController < ApplicationController
      def index
        render json: Meeting.all
      end

      def create_table
        meeting = Meeting.new(meeting_params)

        if meeting.save
          render json: meeting, status: :created
        else
          render json: meeting.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Meeting.find(params[:id]).destroy!

        head :no_content
      end

      private

      def book_params
        params.require(:meeting).permit(:title, :author)
      end

    end
  end
end
