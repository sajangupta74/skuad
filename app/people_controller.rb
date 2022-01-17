require_relative 'people_helper.rb'
require_relative 'people_model.rb'

class PeopleController
  include PeopleHelper

  def initialize(params)
    @params = params
    store_data(params)
  end

  def normalize
    order_by = params[:order]
    people_service = PeopleService.new
    people_service.getPeopleSortedBy(order_by).map do |people_id, people|
      people.to_json.slice('birthdate', 'city', 'first_name')
      people_json = people.to_json
      "#{people_json['first_name']}, #{people_json['city']}, #{people_json['birthdate']}"
    end
  end

  private

  attr_reader :params
end
