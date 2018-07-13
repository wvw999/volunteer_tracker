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

post ('/title') do
  @title = params["title"]
  @id = params["projects_drop"]
  Project.update_title({:title => @title, :id => @id})
  @project_names = Project.all()
  @volunteer_names = Volunteer.all()
  redirect to('/')
end

post ('/delete') do
  @id = params["projects_drop"]
  Project.delete_title({:id => @id})
  @project_names = Project.all()
  @volunteer_names = Volunteer.all()
  redirect to('/')
end

post ('/volunteer') do
  @name = params["volunteer"]
  @id = params["id"]
  @project_id = params["projects_drop"]
  new_volunteer = Volunteer.new({:name => @name, :project_id => @project_id, :id => nil})
  new_volunteer.save()
  redirect to('/')
end

post ('/name') do
  @name = params["volunteer"]
  @id = params["volunteers_drop"]
  Volunteer.update_name({:name => @name, :id => @id})
  @project_names = Project.all()
  @volunteer_names = Volunteer.all()
  redirect to('/')
end
