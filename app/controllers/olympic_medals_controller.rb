class OlympicMedalsController < ApplicationController
  def index
    #Handle req for all countries
    @CountryOlympicMedals = CountryOlympicMedal.all

    # Handle medal_type separately with count
    if params[:medal_type].present? && params[:greater_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_min_medal_count_of_type(params[:medal_type], params[:greater_than])
    end
    if params[:medal_type].present? && params[:less_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_max_medal_count_of_type(params[:medal_type], params[:less_than])
    end

    #Handle medal_total param query
    if params[:medal_total].present? && params[:greater_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_min_total_medal_count(params[:medal_total], params[:greater_than])
    end
    if params[:medal_total].present? && params[:less_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_max_total_medal_count(params[:medal_total], params[:less_than])
    end

    # Apply other filters
    filtering_params.except(:medal_type, :less_than, :greater_than).each do |key, value|
      @CountryOlympicMedals = @CountryOlympicMedals.public_send("by_#{key}", value) if value.present?
    end

    render json: @CountryOlympicMedals
  end

  private

  def filtering_params
    params.slice(:ranks, :medal_type, :greater_than, :less_than, :sort_by, :order, :country_codes, :limit)
  end
end
