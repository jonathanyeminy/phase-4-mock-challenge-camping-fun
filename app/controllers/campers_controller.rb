class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # rescue_from ActiveRecord::RecordInvalid, with: :bad_request

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper, include: :activities
        else render_not_found_response
        end 
    end

    def create
        new_camper = Camper.create!(camper_params)
        if new_camper  
        render json: new_camper
        else bad_request
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def bad_request
        render json: { error: "validation errors" }, status: :bad_request
    end

end
