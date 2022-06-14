class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find_by(id: params[:id])
        if activity
            render json: activity
       else
            render_not_found_response
       end
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            render json: "Activity Deleted!"
        else 
            render_not_found_response
        end
    end

    private

    def render_not_found_response
        render json: {error: "Activity not found"}, status: :not_found
    end
end
