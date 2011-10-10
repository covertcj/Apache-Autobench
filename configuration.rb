require 'yaml'
require './route.rb'

class Configuration

    def load(filename)
        # load the file into a YAML structure
        @config_yml = YAML::load(File.open(filename))
    end

    def get_routes()
        @routes = Array.new

        # loop through the YAML structure
        @config_yml.each do |base_url, site|
            site.each do |path, data|
                @routes.push Route.new(base_url, path, data["connections"], data["concurrent"], data["outfile"])
                
                puts "Loading Route:"
                puts "    Base URL:    #{base_url}"
                puts "    Path:        #{path}"
                puts "    Connections: #{data['connections']}"
                puts "    Concurrent:  #{data['concurrent']}"
                puts "    Outfile:     #{data['outfile']}"
                puts ""
            end
        end
        
        @routes
    end
end
