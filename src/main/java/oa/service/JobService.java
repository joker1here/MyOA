package oa.service;

import oa.mapper.JobMapper;
import oa.pojo.Job;
import oa.util.SqlSessionUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {
    private JobMapper jobMapper = (JobMapper) SqlSessionUtil.getSession(JobMapper.class);
    public Job findJobByJobName(String jobName) {
        return jobMapper.findJobByJobName(jobName);
    }

    public List<Job> findAllJob() {
        return jobMapper.findAllJob();
    }
}
