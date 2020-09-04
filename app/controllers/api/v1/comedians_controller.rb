class Api::V1::ComediansController < ApplicationController
  def index
    comedians = Comedian.all
    return render json: cannot_find_comedians if comedians.empty?
    render json: ComedianSerializer.new(comedians)
  end

  private

    def cannot_find_comedians
      response.status = 404
      response.body = 'Sorry, no comedians avaiable.'
    end
end
