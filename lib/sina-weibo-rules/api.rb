module SinaWeibo
  module API

    def add( rules = [] )
      options = {queries: rules }
      SinaWeibo::Response.new self.class.post('/rules', body: options.to_json)
    end

    def remove( rules = [] )
      options = {queries: rules }
      SinaWeibo::Response.new self.class.delete('/rules', body: options.to_json)
    end

    def list
      SinaWeibo::Response.new self.class.get( '/rules' )
    end

    def delete_all!
      rules = self.list.rules
      sleep 3
      self.remove( rules )
    end


  end
end
