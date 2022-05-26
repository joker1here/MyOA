package oa.mapper;

import oa.pojo.Attendance;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AttendanceMapper {
    @Select("SELECT * FROM attendance ORDER BY SignUpTime DESC")
    List<Attendance> findAllAttendance();

    @Select("SELECT * FROM attendance WHERE AttendanceId = #{id}")
    Attendance findAttendanceById(int id);

    @Insert("insert into attendance VALUES" +
            "(#{AttendanceId},#{AttendanceEmployee},#{SignUpTime},#{SignBackTime})")
    void saveAttendance(Attendance Attendance);

    @Update("update attendance set AttendanceEmployee=#{AttendanceEmployee},SignUpTime=#{SignUpTime},SignBackTime=#{SignBackTime} " +
            "where AttendanceId=#{AttendanceId}")
    void updateAttendance(Attendance Attendance);

    @Delete("DELETE FROM attendance WHERE AttendanceId = #{id}")
    void deleteAttendanceById(int id);

    @Select("SELECT * FROM attendance WHERE AttendanceEmployee=#{employeeId} AND SignBackTime is null AND SignUpTime is not null")
    Attendance alreadySignUp(int employeeId);
}
