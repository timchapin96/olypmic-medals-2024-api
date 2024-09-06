class ParameterSanitizer
  class SanitizationError < StandardError; end


  COUNTRY_CODES = [
  "US", "ITA", "CHN", "GER", "JPN", "NZ", "AUS", "CAN", "FRA", "UZB",
  "NED", "HUN", "GBR", "SPA", "KOR", "SWE", "IRE", "NOR", "BRA", "KEN",
  "IRN", "GRE", "UKR", "ARG", "ROU", "EGY", "GEO", "TUN", "BEL", "BOT",
  "BUL", "CHI", "SRB", "LCA", "CZE", "UGA", "DEN", "DOM", "AZE", "GUA",
  "HRV", "MAR", "CUB", "DMA", "BHR", "PAK", "SVN", "TUR", "TPE", "MEX",
  "AUT", "ARM", "HKG", "COL", "PHI", "PRK", "ALG", "KGZ", "IDN", "LTU",
  "ISR", "IND", "POL", "MDA", "KAZ", "KOS", "JAM", "CYP", "RSA", "FIJ",
  "THA", "JOR", "ETH", "MGL", "CHE", "PAN", "ECU", "TJK", "PRT", "ALB",
  "GRD", "MAS", "PUR", "CPV", "CIV", "EOR", "PER", "QAT", "SGP", "SVK",
  "ZAM"
]


  def initialize(params)
    @params = params
  end

  def sanitized_params
    clean_params = {}

    # Add parameters to the hash only if they are present after sanitization
    clean_params[:rank] = sanitize_medal_type(@params[:medal_type]) if @params[:medal_type].present?
    clean_params[:greater_than] = sanitize_int(@params[:greater_than]) if @params[:greater_than].present?
    clean_params[:less_than] = sanitize_int(@params[:less_than]) if @params[:less_than].present?
    clean_params[:medal_total_max] = sanitize_int(@params[:medal_total_max]) if @params[:medal_total_max].present?
    clean_params[:medal_total_min] = sanitize_int(@params[:medal_total_min]) if @params[:medal_total_min].present?
    clean_params[:min_total] = sanitize_int(@params[:min_total]) if @params[:min_total].present?
    clean_params[:max_total] = sanitize_int(@params[:max_total]) if @params[:max_total].present?
    clean_params[:limit] = sanitize_int(@params[:limit]) if @params[:limit].present?
    clean_params[:sort_by] = sanitize_sort_by(@params[:sort_by]) if @params[:sort_by].present?

    if clean_params.values.any?(&:nil?)
      p clean_params
      raise SanitizationError, "Invalid parameters"
    else
      clean_params
    end
    # clean_params.compact.tap do |params|
    #   p params.values
    #   raise SanitizationError, "Invalid parameters" if params.values.any?(≠ß&:nil?)
    # end
  end

  private

  #Sanitize int
  def sanitize_int(int)
    integer = int.to_i
    integer.to_s == int ? int : nil
  end
  #Sanitize medal type
  def sanitize_medal_type(medal_type)
    %w[gold silver bronze].include?(medal_type.downcase) ? medal_type : nil
  end
  #Sanitize sort_by
  def sanitize_sort_by(sort_val)
    %w[rank total gold silver bronze].include?(sort_val.downcase) ? sort_val : nil
  end
  #Sanitize order
  def sanitize_order(order)
    %w[desc asc].include?(order.downcase) ? order : nil
  end
  #Sanitize country codes
  def sanitize_country_codes(country_codes)
    codes_array = country_codes.to_s.split(',').map(&:strip)
    sanitized_countries = []
    bad_countries = []

    codes_array.each do |country_code|
      if COUNTRY_CODES.include?(country_code.upcase)
        sanitized_countries.push(country_code.upcase)
      else
        bad_countries.push(country_code)
      end
    end

    { sanitized_countries: sanitized_countries, bad_countries: bad_countries }
  end

end
