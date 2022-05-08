package oa.mapper;

import oa.pojo.Relation;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RelationMapper {
    @Select("SELECT * FROM Relation")
    List<Relation> findAllRelation();

    @Select("SELECT * FROM Relation WHERE employeeId = #{id}")
    Relation findRelationById(int id);

    @Insert("insert into Relation VALUES" +
            "(#{employeeId},#{deptId},#{jobId})")
    void saveRelation(Relation Relation);

    @Update("update Relation set deptId=#{deptId},jobId=#{jobId} " +
            "where employeeId=#{employeeId}")
    void updateRelation(Relation Relation);

    @Delete("DELETE FROM Relation WHERE employeeId = #{id}")
    void deleteRelationById(int id);
}
