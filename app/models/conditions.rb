class Conditions < ApplicationRecord

  GOOD_WEATHER = ['windy', 'cloudy', 'mostly cloudy', 'partly cloudy', 'clear', 'sunny', 'fair', 'hot']

  def hot_temp?
    temperature_f.to_f >= 85
  end

  def safe_river_flow?
    (40..300).include? flow_rate_cfs
  end

  def good_weather?
    GOOD_WEATHER.include? weather_condition.downcase
  end

  def tubable?
    hot_temp? and safe_river_flow? and good_weather?
  end

  def reasons
    reasons = []
    reasons << 'it is not hot enough' unless hot_temp?
    reasons << 'the river flow is too low' unless flow_rate_cfs >= 40
    reasons << 'the river flow is too high' unless flow_rate_cfs <= 300
    reasons << 'it is not good weather' unless good_weather?
    reasons
  end

end
