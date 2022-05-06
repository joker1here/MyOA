package oa.mapper;

import oa.pojo.Job;

import java.util.List;

public interface JobMapper {
    List<Job> findAllJob();

    Job findJobById(int id);

    void saveJob(Job Job);

    void updateJob(Job Job);

    void deleteJobById(int id);
}
