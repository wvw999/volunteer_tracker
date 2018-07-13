require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('./lib/project.rb')
require('./lib/volunteer.rb')
require("pry")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get ('/') do
  @project_names = Project.more()
  @volunteer_names = Volunteer.more()
  erb(:input)
end

post ('/project') do
  @title = params["project"]
  new_project = Project.new({:title => @title, :id => nil})
  new_project.save()
  @project_names = Project.all()
  @volunteer_names = Volunteer.all()
  redirect to('/')
end
#
# post ('/project') do
#
#   redirect to('/')
# end
#
# post ('/project') do
#
#   redirect to('/')
# end
#
# post ('/project') do
#
#   redirect to('/')
# end
#
# post ('/project') do
#
#   redirect to('/')
# end
