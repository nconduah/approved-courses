class CoursesController < ApplicationController
    
    http_basic_authenticate_with name: "sdmstud", password: "sociotechnical", except: [:index, :show, :delete]
    #http_basic_authenticate_with name: "sdmadmin", password: "rearchitect", except: [:index, :show]

    def index
        @courses = Course.order(params[:sort])
    end
    
    def show
        @course = Course.find(params[:id])
    end
    
    def new
        @course = Course.new
    end

    def edit
        @course = Course.find(params[:id])
    end

    def create
        #render plain: params[:course].inspect
        # @course = Course.new(params[:course])
        @course = Course.new(course_params)

        if @course.save
            redirect_to @course
        else
            render 'new'
        end
    end

    def update
        @course = Course.find(params[:id])

        if @course.update(course_params)
            redirect_to @course
        else
            render 'edit'
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy

        redirect_to courses_path
    end

    def import
        Course.import(params[:file])
        redirect_to root_url, notice: "Course Data Imported!"
    end

    private
        def course_params
            params.require(:course).permit(:number, :title, :semester, :category, :cataloglink, :evaluationlink, :recenttakers, :notes )
        end
end
