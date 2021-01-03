module Api 
  module V1
    class MeetingsController < ApplicationController
      MAX_PAGINATION_LIMIT = 100

      def index
        meetings = Meeting.limit(limit).offset(params[:offset])

        render json: MeetingsRepresenter.new(meetings).as_json
      end

      def create
        author = Author.create!(author_params)
        meeting = Meeting.new(meeting_params.merge(author_id: author.id))

        if meeting.save
          render json: MeetingRepresenter.new(meeting).as_json, status: :created
        else
          render json: meeting.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Meeting.find(params[:id]).destroy!

        head :no_content
      end

      private

      def limit
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
          MAX_PAGINATION_LIMIT
        ].min
      end

      def meeting_params
        params.require(:meeting).permit(:title)
      end

      def author_params
        params.require(:author).permit(:first_name, :last_name, :section)
      end

    end
  end
end
