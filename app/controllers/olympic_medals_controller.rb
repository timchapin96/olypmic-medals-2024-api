class OlympicMedalsController < ApplicationController
  def index
    #Handle req for all countries
    @medals = CountryOlympicMedal.all


    # Handle medal_type separately with count
    if params[:medal_type].present? && params[:count].present?
      @medals = @medals.by_medal_type(params[:medal_type], params[:count])
    end

    # Apply other filters
    filtering_params.except(:medal_type, :count).each do |key, value|
      @medals = @medals.public_send("by_#{key}", value) if value.present?
    end

    render json: @medals
  end

  private

  def filtering_params
    params.slice(:ranks, :medal_type, :count, :sort_by, :order, :country_codes, :limit)
  end
end
