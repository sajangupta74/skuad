class PeopleModel
  attr_accessor :id, :first_name, :last_name, :city, :birthdate

  def to_json
    json = {}
    self.instance_variables.each do |attribute|
      json[attribute.to_s.gsub('@', '')] = self.instance_variable_get(attribute)
    end
    json
  end
end