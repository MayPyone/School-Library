class Classroom
  def initialize(label: 'unknown')
    @label = label
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
