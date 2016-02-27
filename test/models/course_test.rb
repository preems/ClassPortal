require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
      @cs = Course.new(number: "3323", title: "testcourse", desc: "course on testing", startDate: "01/10/16", endDate: "10/10/16", status: "active")
    end

  test "Course count of objects from fixtures data" do
    assert_equal(3, Course.count,"Unable to create objects")
  end
  test "Course creation succeeds with valid arguments" do
    c = Course.new
    c.number = "571"
    c.title = "network1"
    c.desc ="networking"
    c.startDate ="01-01-16"
    c.endDate ="05-05-16"
    c.status = "active"
    assert(c.save, "course could not be added")
  end
  test "Course creation failing when no arguments are provided" do
    d = Course.new
    assert_not(d.save, "course could be created with blank values")
  end
  test "Course creation fails when status is not either active/inactive" do
    d = Course.new
    d.number = "3232"
    d.title = "programming"
    d.desc = "programming beginners"
    d.startDate = "01-01-16"
    d.endDate = "05-05-16"
    d.status = "invalid status"
    assert_not(d.save, "course got saved with invalid status")
  end
  test "Changing course title to blank fails" do
     @cs.title = ""
     assert_not(@cs.valid?, "Able to change course title to blank")
  end
  test "Changing course status to valid value succeeds" do
      @cs.status = "inactive"
      assert(@cs.valid?, "Unable to change course status to valid value")
  end
  test "Changing course status to invalid value shouldn't succeed" do
      @cs.status = "blahblah"
      assert_not(@cs.valid?, "Able to change status to invalid value")
  end
end
