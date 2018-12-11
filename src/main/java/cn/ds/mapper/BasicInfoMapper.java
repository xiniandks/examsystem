package cn.ds.mapper;

import cn.ds.pojo.BasicInfo.*;
import cn.ds.pojo.Student;

import java.util.List;

public interface BasicInfoMapper {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
    List<Blass>findCiAll(Long maid);
    Class findCiId(Long id);
    void CreateSemester(Semester semester);
    void CreateMajor(Major major);
    void CreateBlass(Blass blass);
    void CreaStudent(Student student);
    List<Student>findClass(String classname);

     Integer deleteSemester(int[] id_arr);//批量删除

}
