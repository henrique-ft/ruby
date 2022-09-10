# Gem install httparty

require 'httparty'

# Essa gem facilita requisições para API's externas

class EdutechionalResty
  include HTTParty
  base_uri "edutechional-resty.herokuapp.com/"

  def posts
    self.class.get('/posts.json')
  end
end

edutechional_resty =  EdutechionalResty.new

edutechional_resty.posts.each do |post|
  p "Title: #{post['title']}"
end

# Mostra os dados retornados pela API

puts edutechional_resty.posts

# Você também pode fazer de uma maneira mais simples. A linha abaixo faz uma requisição get para uma api do stackexchange

response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

puts response.body # Response...
puts response.code # 200
puts response.message # Ok
puts response.headers.inspect # Headers...

class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, page)
    @options = {query: {site: service}}
  end

  def questions
    self.class.get('/2.2/questions', @options)
  end

  def users
    self.class.get('/2.2/users', @options)
  end
end

stack_exchange = StackExchange.new('stackoverflow', 1)
puts stack_exchange.questions
puts stack_exchange.users
