require 'rails_helper'

describe Conditions do
  let(:good_conditions) { Conditions.new(temperature_f: 87, flow_rate_cfs: 100, weather_condition: 'sunny') }
  let(:bad_conditions) { Conditions.new(temperature_f: 80, flow_rate_cfs: 35, weather_condition: 'Rainy') }

  describe 'hot_temp?' do
    it 'is true when the temperature is higher than 85' do
      expect(good_conditions.hot_temp?).to be true
    end

    it 'is false when the temperature is lower than 85' do
      expect(bad_conditions.hot_temp?).to be false
    end
  end

  describe 'safe_river_flow?' do
    it 'is true when the river flow is between 40 and 300 cfs' do
      expect(good_conditions.safe_river_flow?).to be true
    end

    it 'is false when the river flow is below 40' do
      expect(bad_conditions.safe_river_flow?).to be false
    end
  end

  describe 'good_weather?' do
    it 'is true when the weather is sunny' do
      expect(good_conditions.good_weather?).to be true
    end

    it 'is false when the weather is rainy' do
      expect(bad_conditions.good_weather?).to be false
    end
  end

  describe 'tubable?' do
    it 'is true when the tubing conditions are good' do
      expect(good_conditions.tubable?).to be true
    end

    it 'is false when the tubing conditions are bad' do
      expect(bad_conditions.tubable?).to be false
    end
  end
end