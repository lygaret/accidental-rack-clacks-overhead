require 'minitest/mock'
require 'minitest/autorun'
require './accidental/rack/clacks_overhead'

describe Accidental::Rack::ClacksOverhead do
  specify "the header is added" do
    # response from downstream
    downstream = [200, {'Content-Type': 'text/plain'}, ['output']]

    # mock request env
    env = Minitest::Mock.new

    # mock downstream rack app
    app = Minitest::Mock.new 
    app.expect(:call, downstream, [env])

    # call the middleware
    subject = Accidental::Rack::ClacksOverhead.new(app, "alpha", "beta", "gamma")
    result  = subject.call(env)

    assert app.verify # it called the downstream app
    assert_equal result[0], downstream[0] # status unchanged
    assert_equal result[1], downstream[1].merge("X-Clacks-Overhead" => "GNU alpha, beta, gamma")
    assert_equal result[2], downstream[2] # body unchanged
  end
end

