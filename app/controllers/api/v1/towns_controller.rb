class Api::V1::TownsController < ApplicationController
  def index
    render json: Town.all
  end
end