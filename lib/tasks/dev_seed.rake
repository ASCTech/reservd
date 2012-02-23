namespace :db do
  namespace :development do

    desc 'drop, create, schema load, seed and populate'
    task :recreate => ['db:drop', 'db:create', 'db:schema:load', 'db:seed', :populate]

    desc 'populates the DB with fake data'
    task :populate => :environment do
      generic_type = ResourceType.create!(:name => 'Resource')
      room_type    = ResourceType.create!(:name => 'Room')
      smith4187 = room_type.resources.create!(:name => '4187 Smith Lab')
      has_projector_type = AttributeType.create!(:name => 'has_projector', :data_type => 'boolean')
      smith4187.attributes.create!(:attribute_type_id => has_projector_type, :boolean_value => false)
    end
  end
end
