module SinaWeibo
  module API
    def add(rules)
      options = ActiveSupport::JSON.encode( {:rules => rules} )
      puts options
      SinaWeibo::Response.new self.class.post('/rules.json', :body => options)
    end

    def remove( rules )
      options = ActiveSupport::JSON.encode( {:rules => rules} )
      SinaWeibo::Response.new self.class.delete('/rules.json', :body => options)
    end

    def list
      SinaWeibo::Response.new self.class.get( '/rules.json')
    end

    def delete_all!
      rules = self.list.rules
      sleep 3
      self.remove( rules )
    end

  end
end
