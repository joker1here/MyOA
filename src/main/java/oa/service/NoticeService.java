package oa.service;

import oa.mapper.NoticeMapper;
import oa.pojo.Notice;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    private NoticeMapper noticeMapper = (NoticeMapper) SqlSessionUtil.getSession(NoticeMapper.class);
    public List<Notice> findAllNotice() {
        return noticeMapper.findAllNotice();
    }

    public String deleteNoticeById(int noticeId) {
        try {
            noticeMapper.deleteNoticeById(noticeId);
        }catch (Exception e){
            return "数据库错误";
        }
        return "删除成功！";
    }

    public String addNotice(Notice notice) {
        try {
            noticeMapper.saveNotice(notice);
        }catch (Exception e){
            return "数据库错误";
        }
        return "成功添加！";
    }

    public int countNotice() {
        return noticeMapper.countNotice();
    }
}
