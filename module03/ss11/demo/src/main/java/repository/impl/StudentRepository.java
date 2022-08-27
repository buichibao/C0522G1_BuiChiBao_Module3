package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private  static  List<Student> studentList =new ArrayList<>();
    static {
        studentList.add(new Student(1,"bao1",true,"22-02-2001",5,"bcbao1",1,"chibao1@gmail.com"));
        studentList.add(new Student(2,"bao2",true,"22-02-2001",5,"bcbao2",1,"chibao2@gmail.com"));
        studentList.add(new Student(3,"bao3",true,"22-02-2001",5,"bcbao3",1,"chibao3@gmail.com"));
        studentList.add(new Student(4,"bao4",true,"22-02-2001",5,"bcbao4",1,"chibao4@gmail.com"));
    }
    @Override
    public List<Student> findByAll() {
        return studentList;
    }

    @Override
    public void add(Student student) {
        studentList.add(student);
    }
}
