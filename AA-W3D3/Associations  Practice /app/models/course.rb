class Course < ActiveRecord::Base

  belongs_to :instructor,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :instructor_id

  belongs_to :prereq,
    class_name: 'Course',
    primary_key: :id,
    foreign_key: :prereq_id

  # has_one :prereq,
  #   class_name: 'Course',
  #   primary_key: :prereq_id,
  #   foreign_key: :id

  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :course_id

  has_many :enrolled_students,
    through: :enrollments,
    source: :student


end
