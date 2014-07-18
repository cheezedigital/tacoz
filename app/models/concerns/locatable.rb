module Locatable
  extend ActiveSupport::Concern

  include do
    include Elasticsearch::Model
    index_name "tacoz_#{Rails.env.to_s.downcase}_#{name.underscore}"

    mapping do
      indexes :street_address
      indexes :city
      indexes :state
      indexes :address, analyzer: 'simple'
      indexes :coordinates, type: 'geo_point', lat_lon: true, normalize: false, validate: true
    end
  end

  def coordinates
      [latitude, longitude].join(',')
  end

  def as_indexed_json(options={})
      as_json(
        only: [
          :street_address,
          :street_address2,
          :city,
          :state,
          :zip
        ],
        methods: [
          :coordinates,
          :address
        ],
      )
  end

  module ClassMethods
    def search(params)
      es = __elasticsearch__
      definition = {
        query: {
          query_string: {
            query: params[:q].blank? ? '*' : params[:q],
            default_operator: 'AND'
          }
        }
      }

      if params[:coordinates] && params[:distance].present?
        definition.merge!({
          filter: {
            geo_distance: {
              distance: "#{params[:distance]}mi",
              coordinates: {
                lon: params[:coordinates][0],
                lat: params[:coordinates][1]
              }
            }
          }
        })
      end

      es.search(definition)
    end
  end
end
