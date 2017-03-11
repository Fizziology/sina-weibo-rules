module SinaWeibo
  module API

    def add( keyword )
      options = {addAll: {keyword: keyword}}
      SinaWeibo::Response.new self.class.put('/keywords', body: options.to_json)
    end

    def remove( keyword )
      options = {keyword: keyword}
      SinaWeibo::Response.new self.class.delete('/keywords', query: options)
    end

    def list
      SinaWeibo::Response.new self.class.get( '/keywords' )
    end

  end
end
