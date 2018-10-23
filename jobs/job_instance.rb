require "./jobs/hello_me_job.rb"
require "./jobs/hello_world_job.rb"
require "./jobs/error_job.rb"

class JobInstance
    def initialize(*args)
        args = args.flatten
        @job = args.delete_at(0)
        @job_arguments = args
        @fails = 0
    end

    def run
        case @job
        when "HelloWorldJob"
            job = HelloWorldJob.perform
        when "HelloMeJob"
            job = HelloMeJob.perform(@job_arguments)
        when "ErrorJob"
            job = ErrorJob.perform
        else
            return "The job does not exist"
        end
        puts job
        job
    end

    def increment_fails
        @fails += 1
    end

    def get_fails
        @fails
    end
end
