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
}
