require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to target URL' do
    link = links(:one)

    link_tracker_mock = Minitest::Mock.new
    link_tracker_mock.expect(:execute, nil)

    LinkTracker.stub(:new, link_tracker_mock) do
      get("/#{link.slug}")
    end

    link_tracker_mock.verify

    assert_redirected_to(link.target_url)
  end

  test 'should throw not found when link does not exists' do
    get('/notfound')

    assert_response(:not_found)
  end
end
