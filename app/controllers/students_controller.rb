class StudentsController < ApplicationController
  def index
    @students=StudentInformation.all
  end

  def new
    @student=StudentInformation.new
    @countries=Country.all
    @cities=City.all
  end

  def create
    @student=StudentInformation.new(check_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new ,status: :unprocessable_entity
    end
  end

  def update
    @student=StudentInformation.find(params[:id])
    if(@student.update(check_params))
      redirect_to student_path(@student)
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def edit
    @student=StudentInformation.find(params[:id])
    @countries=Country.all
    @cities=City.all
  end

  def show
    @student=StudentInformation.find(params[:id])
  end
  def destroy
    @student=StudentInformation.find(params[:id])
    @student.delete
    redirect_to "/"
  end

  private
  def check_params
    params.require(:student).permit(:name,:email,:country_id,:phone,:city_id,:gender,:extra_Activities => [])
  end
end
