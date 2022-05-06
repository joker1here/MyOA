package oa.mapper;

import oa.pojo.Notice;

import java.util.List;

public interface NoticeMapper {
    List<Notice> findAllNotice();

    Notice findNoticeById(int id);

    void saveNotice(Notice Notice);

    void updateNotice(Notice Notice);

    void deleteNoticeById(int id);
}
