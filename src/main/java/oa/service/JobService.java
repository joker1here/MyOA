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
                return "Success Update!";
            } catch (Exception e) {
                return "DataBase Wrong!";
            }
        }else {
            try{
                jobMapper.saveJob(job);
                return "Success Save!";
            }catch (Exception e){
                return "DataBase Wrong!";
            }
        }
    }

    public String delete(int jobId) {
        try{
            jobMapper.deleteJobById(jobId);
            return "Success!";
        }catch (Exception e){
            return "DataBase Wrong!";
        }
    }
}
