require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/dictionary")
require("pry")

get("/") do
    erb(:index)
end
