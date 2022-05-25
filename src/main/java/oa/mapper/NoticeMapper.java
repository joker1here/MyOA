package oa.mapper;

import oa.pojo.Notice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface NoticeMapper {
    @Select("SELECT * FROM notice ORDER BY NoticeTime DESC")
    List<Notice> findAllNotice();

    @Select("SELECT * FROM notice WHERE NoticeId = #{id}")
    Notice findNoticeById(int id);

    @Insert("insert into notice VALUES " +
            "(#{noticeId},#{noticeName},#{noticeInfo},#{noticeTime},#{employeeId})")
    void saveNotice(Notice Notice);

    @Update("update notice set noticeName=#{noticeName},noticeInfo=#{noticeInfo}," +
            "noticeTime=#{noticeTime},employeeId=#{employeeId} " +
            "where noticeId=#{noticeId}")
    void updateNotice(Notice Notice);

    @Delete("DELETE FROM notice WHERE NoticeId = #{id}")
    void deleteNoticeById(int id);
}
