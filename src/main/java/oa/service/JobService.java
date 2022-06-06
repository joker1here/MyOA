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

    public Job findJobByJobId(int jobId) {
        return jobMapper.findJobById(jobId);
    }

    public String update(Job job) {
        if (job.getJobId()!=0) {
            try {
                jobMapper.updateJob(job);
                return "成功更新!";
            } catch (Exception e) {
                return "数据库错误!";
            }
        }else {
            try{
                jobMapper.saveJob(job);
                return "成功保存!";
            }catch (Exception e){
                return "数据库错误!";
            }
        }
    }

    public String delete(int jobId) {
        try{
            jobMapper.deleteJobById(jobId);
            return "成功删除!";
        }catch (Exception e){
            return "数据库错误!";
        }
    }
}
