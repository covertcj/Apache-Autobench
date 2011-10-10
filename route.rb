class Route

    attr_accessor :base_url, :path, :url
    attr_accessor :num_concurrent, :num_connections
    attr_accessor :outfile

    def initialize(base_url, path, num_connections, num_concurrent, outfile)
        @base_url        = base_url
        @path            = path
        
        @url             = base_url + path
        
        @num_connections = num_connections
        @num_concurrent  = num_concurrent
        
        @outfile         = outfile
    end

end