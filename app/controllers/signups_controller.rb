class SignupsController < ApplicationController
    def create
        signup = Signup.create!(signup_params)
        if signup
            render json: signup.activity
        else
            bad_request
        end

    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def bad_request
        render json: { error: "validation errors" }, status: :bad_request
    end
end
