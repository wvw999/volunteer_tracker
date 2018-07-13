require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("pry")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})
