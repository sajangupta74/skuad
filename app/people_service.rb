require_relative 'people_model.rb'

class PeopleService
  @@people = {}
  @@max_people_id = 0

  def addPeople(people_attr: {})
    @@max_people_id += 1
    people_object = PeopleModel.new
    people_object.id = @@max_people_id
    people_object.first_name = people_attr['first_name']
    people_object.last_name = people_attr['last_name']
    people_object.city = people_attr['city']
    people_object.birthdate = people_attr['birthdate']
    @@people[@@max_people_id] = people_object
    people_object
  end

  def getPeopleSortedBy(attr)
    @@people.sort_by do |people_id, people_object|
      people_object.send(attr.to_sym)
    end
  end
end