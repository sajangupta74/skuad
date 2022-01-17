require 'csv'

module PeopleHelper
  def store_data(params)
    params.each do |key, file|
      if key.to_s.include?('format')
        delimeter = file.match(/\s.\s/)
        csv = convert_to_csv(file, delimeter: delimeter)
        add_people_from_csv(csv)
      end
    end
  end

  def convert_to_csv(text_data, delimeter: ',')
    csv = CSV.parse(text_data, headers: true, col_sep: delimeter)
  end

  def add_people_from_csv(csv)
    people_service = PeopleService.new
    csv.each do |row|
      birthdate = Date.parse(row['birthdate'])
      people_service.addPeople(people_attr: {
        'first_name' => row['first_name'],
        'last_name' => row['last_name'],
        'birthdate' => birthdate.strftime('%m/%d/%Y'),
        'city' => row['city']
      })
    end
  end
end