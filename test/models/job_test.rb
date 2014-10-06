require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'save valid job' do
    j = Job.new(title: 'A', description: 'A', user_id: 1)
    assert j.save
  end

  test 'no saving invalid jobs' do
    j = Job.new(description: 'A', user_id: 1)
    assert !j.save

    j2 = Job.new(title: 'A', user_id: 1)
    assert !j2.save
  end
end
