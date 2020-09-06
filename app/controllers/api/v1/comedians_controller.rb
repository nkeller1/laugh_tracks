class Api::V1::ComediansController < ApplicationController
  def index
    if params[:age]
      comedians = Comedian.where(age: params[:age])
    elsif params[:name]
      comedians = Comedian.where(name: params[:name])
    elsif params[:city]
      comedians = Comedian.where(city: params[:city])
    else
      comedians = Comedian.all
    end
    return render json: cannot_find_comedians if comedians.empty?
    render json: ComedianSerializer.new(comedians, include: [:tvspecials])
  end

  private

    def cannot_find_comedians
      response.status = 404
      response.body = 'Sorry, no comedians avaiable.'
    end
end
