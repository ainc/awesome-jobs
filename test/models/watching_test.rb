require 'test_helper'

class WatchingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'create normal watching' do
    w = Watching.new(user_id: 1, job_id: 1)
    assert w.save
  end

  test 'no saving duplicate watchings' do
    w = Watching.new(user_id: 2, job_id: 2)
    assert w.save

    w2 = Watching.new(user_id: 2, job_id: 2)
    assert !w2.save
  end
end
