class Api::V1::StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
        @students = Student.all

        render json: @students
    end

    def create
        @student = Student.create(student_params(:name, :img_url, :github_url, :graduated))

        if @student.valid? 
            render json: @student
        else
            render json: { error: "Could not create student", errors: @student.errors.full_messages}
        end
    end

    def show

        render json: @student
    end

    def edit
        render json: @student
    end

    def update
        @student.update( student_params(:name, :img_url, :github_url, :graduated) )

        if student_params(:name)
            @student.generate_slug
        end
        render json: @student
    end

    def destroy

    end

    private
    
    def student_params(*args)
        params.require(:student).permit(*args)
    end

    def set_student
        @student = Student.find_by_slug(params[:slug])
    end
end
