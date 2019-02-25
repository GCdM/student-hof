class Api::V1::ProjectsController < ApplicationController
    before_action :set_project, only: [:show]

    def index
        @projects = Project.all

        render json: @projects
    end

    # def create

    # end

    def show
        if @project
            render json: @project
        else
            render json: { error: "Could not find project" }
        end
    end

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end

    private

    def project_params(*args)
        params.require(:project).permit(*args)
    end

    def set_project
        @project = Project.find_by_slug(params[:slug])
    end

end