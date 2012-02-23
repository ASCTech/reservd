namespace :db do
  namespace :development do

    desc 'drop, create, schema load, seed and populate'
    task :recreate => ['db:drop', 'db:create', 'db:schema:load', 'db:seed', :populate]

    desc 'populates the DB with fake data'
    task :populate => :environment do
      generic_type = ResourceType.create!(:name => 'Resource')
      room_type    = ResourceType.create!(:name => 'Room')
      room_type.resources.create!(:name => '4187 Smith Lab')
    end
  end
end
