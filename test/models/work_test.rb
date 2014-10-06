require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'save valid work' do
    w = Work.new(title: 'A', description: 'A', url: 'google.com', user_id: 1)
    assert w.save
  end

  test 'no saving invalid works' do
    w = Work.new(description: 'A', url: 'google.com', user_id: 1)
    assert !w.save

    w2 = Work.new(title: 'A', url: 'google.com', user_id: 1)
    assert !w2.save

    w3 = Work.new(title: 'A', description: 'A', user_id: 1)
    assert !w3.save
  end
end
