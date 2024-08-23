class CountriesController < ApplicationController
  def index
    #Handle req for all countries
    @countries = Country.all
    puts Country.by_country_code('US').to_sql


    # Handle medal_type separately with count
    if params[:medal_type].present? && params[:count].present?
      @countries = @countries.by_medal_type(params[:medal_type], params[:count])
    end

    # Apply other filters
    filtering_params.except(:medal_type, :count).each do |key, value|
      @countries = @countries.public_send("by_#{key}", value) if value.present?
    end

    render json: @countries
  end

  private

  def filtering_params
    params.slice(:rank, :medal_type, :count, :sort_by, :order)
  end
end
