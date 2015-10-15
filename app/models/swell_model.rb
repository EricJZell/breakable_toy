class SwellModel < ActiveRecord::Base
  validates :entry_id, presence: true
  belongs_to :entry

  def wind_direction
    get_direction(swell_data['wind']['direction'])
  end

  def wind_speed
    swell_data['wind']['speed']
  end

  def wave_height
    swell_data['swell']['components']['combined']['height']
  end

  def primary_height
    swell_data['swell']['components']['primary']['height']
  end

  def primary_period
    swell_data['swell']['components']['primary']['period']
  end

  def primary_direction
    get_direction(swell_data['swell']['components']['primary']['direction'])
  end

  def secondary_height
    if swell_data['swell']['components']['secondary']
      swell_data['swell']['components']['secondary']['height']
    else
      '0'
    end
  end

  def secondary_period
    if swell_data['swell']['components']['secondary']
      swell_data['swell']['components']['secondary']['period']
    else
      '0'
    end
  end

  def secondary_direction
    if swell_data['swell']['components']['secondary']
      get_direction(swell_data['swell']['components']['secondary']['direction'])
    else
      '-'
    end
  end

  def get_direction(raw)
    rounded = ((raw * 2).round(-1)) / 2
    if rounded <= 180
      return rounded + 180
    else
      return rounded - 180
    end
  end
end
