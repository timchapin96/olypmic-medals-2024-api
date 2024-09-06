class OlympicMedalsController < ApplicationController

  def index
    begin
      sanitizer = ParameterSanitizer.new(filtering_params.to_h)
      sanitized_params = sanitizer.sanitized_params
    rescue ParameterSanitizer::SanitizationError => e
      render json: { error: "#{filtering_params} are #{e.message}"}, status: :bad_request
      return
    rescue StandardError => e
      render json: { error: 'Internal Server Error' }, status: :internal_server_error
      return
    end

    #Handle req for all countries
    @CountryOlympicMedals = CountryOlympicMedal.all

    # Handle medal_type separately with count
    if sanitized_params[:medal_type].present? && sanitized_params[:greater_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_min_medal_count_of_type(sanitized_params[:medal_type], sanitized_params[:greater_than])
    elsif sanitized_params[:medal_type].present? && sanitized_params[:less_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_max_medal_count_of_type(sanitized_params[:medal_type], sanitized_params[:less_than])
    elsif sanitized_params[:medal_type].present? && sanitized_params[:less_than].present? && sanitized_params[:greater_than].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_between_medal_count_of_type(sanitized_params[:medal_type], sanitized_params[:greater_than], sanitized_params[:less_than])
    end

    #Handle medal_total param query
    if sanitized_params[:medal_total_min].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_min_total_medal_count(sanitized_params[:medal_total_min])
    end
    if sanitized_params[:medal_total_max].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_max_total_medal_count(sanitized_params[:medal_total_max])
    end
    if sanitized_params[:medal_total_min].present? && sanitized_params[:medal_total_max].present?
      @CountryOlympicMedals = @CountryOlympicMedals.by_between_total_medal_count(sanitized_params[:medal_total_min], sanitized_params[:medal_total_max])
    end

    # Apply other filters
    filtering_params.except(:medal_type, :less_than, :greater_than, :medal_total_min, :medal_total_max).each do |key, value|
      @CountryOlympicMedals = @CountryOlympicMedals.public_send("by_#{key}", value) if value.present?
    end

    render json: @CountryOlympicMedals
  end

  private

  def filtering_params
    params.permit(
      :ranks,
      :medal_type,
      :greater_than,
      :less_than,
      :medal_total_max,
      :medal_total_min,
      :min_total,
      :max_total,
      :sort_by,
      :order,
      :country_codes,
      :limit
      )
  end
end
