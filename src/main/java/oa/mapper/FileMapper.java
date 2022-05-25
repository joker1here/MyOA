package oa.mapper;

import oa.pojo.File;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface FileMapper {
    @Select("SELECT * FROM file")
    List<File> findAllFile();

    @Select("SELECT * FROM file WHERE FileId = #{id}")
    File findFileById(int id);

    @Insert("insert into file VALUES" +
            "(#{fileId},#{fileTitle},#{fileName},#{fileForm},#{fileTime},#{fileText},#{FileTo},#{employeeId},#{fileRead})")
    void saveFile(File File);

    @Update("update file set " +
            "fileName=#{fileName},fileTitle=#{fileTitle},fileForm=#{fileForm},fileTime=#{fileTime}" +
            ",fileText=#{fileText},FileTo=#{FileTo},employeeId=#{employeeId},fileRead=#{fileRead} " +
            "where FileId=#{fileId}")
    void updateFile(File File);

    @Delete("DELETE FROM file WHERE FileId = #{id}")
    void deleteFileById(int id);

    //计数未读邮件
    @Select("SELECT COUNT(1) FROM file WHERE FileRead=0 AND FileTO=#{employeeId}")
    int CountFileNoRead(int employeeId);

    //返回已读文件列表
    @Select("SELECT * FROM file WHERE FileRead=1 AND FileTO=#{employeeId}")
    List<File> ShowReceiveFileRead(int employeeId);

    //返回未读邮件列表
    @Select("SELECT * FROM file WHERE FileRead=0 AND FileTO=#{employeeId}")
    List<File> ShowReceiveFileNoRead(int employeeId);

    //返回收件箱
    @Select("SELECT * FROM file WHERE FileTO=#{employeeId} ORDER BY FileTime DESC")
    List<File> findAllReceiveFileByEmployeeId(int employeeId);

    //返回发件箱
    @Select("SELECT * FROM file WHERE EmployeeID =#{employeeId} ORDER BY FileTime DESC")
    List<File> findAllSentByEmployeeId(int employeeId);
}
