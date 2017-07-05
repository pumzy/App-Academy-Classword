class User < ActiveRecord::Base


  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :student_id

  has_many :enrolled_courses,
   through: :enrollments, # method on user connecting to class Enrollment
   source: :course # method on enrollment connecting to class Course


end
