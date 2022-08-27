package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findByAll();
    void add(Student student);
}
