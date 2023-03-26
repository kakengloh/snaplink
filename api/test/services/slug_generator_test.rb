class SlugGeneratorTest < ActiveSupport::TestCase
  class MockQueryResult
    def values
      1
    end
  end

  test 'should generate a slug' do
    active_record_base_connection_mock = Minitest::Mock.new
    active_record_base_connection_mock.expect(:execute, MockQueryResult.new, ["SELECT nextval('slug_seq')"])

    ActiveRecord::Base.stub(:connection, active_record_base_connection_mock) do
      slug = SlugGenerator.new.execute
      assert_equal('3eLpeV', slug)
    end
  end
end
