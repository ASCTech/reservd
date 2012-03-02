namespace :db do
  namespace :development do

    desc 'drop, create, schema load, seed and populate'
    task :recreate => ['db:drop', 'db:create', 'db:schema:load', 'db:seed', :populate]

    desc 'populates the DB with fake data'
    task :populate => :environment do
      generic_type = ResourceType.create!(:name => 'Resource')
      room_type    = ResourceType.create!(:name => 'Room')
      smith4187 = room_type.resources.create!(:name => '4187 Smith Lab')
      has_projector_type = PropertyType.create!(:name => 'has_projector', :data_type => 'boolean')
      smith4187.properties.create!(:property_type_id => has_projector_type.id, :boolean_value => false)
      num_seats_type = PropertyType.create!(:name => 'number_of_seats', :data_type => 'integer')
    end
  end
end
