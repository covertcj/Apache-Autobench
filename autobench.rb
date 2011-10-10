require './configuration.rb'

def writefile(route, result)
    # make the directory if it doesnt exist
    if not FileTest::directory?('results')
        Dir::mkdir('results/')
    end
    
    f = File.new('results/' + route.outfile, 'w+')
    f.syswrite result
end

# set the routes file to the passed parameter
ARGV.each do |a|
    @routes_file = a
end

# if there was no param, set the defualt
if @routes_file.nil? or @routes_file.empty?
    @routes_file = 'routes.yml'
end

# load the yaml route configurations
config = Configuration.new
config.load @routes_file
routes = config.get_routes

# test each route
routes.each do |route|
    puts "                                 "
    puts "---------------------------------"
    puts "-- Benching: #{route.url}        "
    puts "---------------------------------"

    result = `ab -n #{route.num_connections} -c #{route.num_concurrent} #{route.url}`

    writefile(route, result)
end