require 'helper'

class TestSinaWeiboRules < Test::Unit::TestCase
  context 'SinaWeibo' do 
    setup do 
      @weibo = SinaWeibo::Rules.new
    end

    should "allow creation of rules" do
      response = @weibo.add([SinaWeibo::Rule.new( '"new spyro"' )])
      assert{ response.response.class == Net::HTTPCreated }
    end

    should 'allow removal of rules' do 
     response = @weibo.remove([SinaWeibo::Rule.new( '"new spyro"' )])
     assert{ response.response.class == Net::HTTPOK }
    end

    should 'allow creation of tagged rules' do 
      response = @weibo.add([ SinaWeibo::Rule.new('#skylanders -skylanders -spyro', 'Skylanders')])
      assert{ response.response.class == Net::HTTPCreated }
    end

    should 'list all rules' do
      response = @weibo.list
      assert{ response.response.class == Net::HTTPOK }
    end

    should 'delete all rules' do 
      response = @weibo.delete_all!
      assert{ response.response.class == Net::HTTPOK }
      assert{ @weibo.list["rules"].empty? }
    end

  end
end
