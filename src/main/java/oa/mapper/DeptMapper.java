package oa.mapper;

import oa.pojo.Dept;

import java.util.List;

public interface DeptMapper {
    List<Dept> findAllDept();

    Dept findDeptById(int id);

    void saveDept(Dept dept);

    void updateDept(Dept dept);

    void deleteDeptById(int id);
}
