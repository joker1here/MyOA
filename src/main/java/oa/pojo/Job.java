package oa.pojo;

public class Job {
    private int jobId;
    private String jobIntroduce;
    private String jobName;

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobIntroduce() {
        return jobIntroduce;
    }

    public void setJobIntroduce(String jobIntroduce) {
        this.jobIntroduce = jobIntroduce;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }


    @Override
    public String toString() {
        return "JobMapper{" +
                "jobId=" + jobId +
                ", jobIntroduce='" + jobIntroduce + '\'' +
                ", jobName='" + jobName +
                '}';
    }
}
