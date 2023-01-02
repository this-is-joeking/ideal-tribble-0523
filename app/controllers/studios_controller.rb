class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:studio_id])
  end
end