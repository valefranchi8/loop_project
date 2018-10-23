require "./delay_job.rb"
require "./queue.rb"
require "./jobs/job_instance.rb"


def perform_now(arguments)
    job_instance = JobInstance.new(arguments)
    execute(job_instance)
end

def perform_later(arguments)
    job_instance = JobInstance.new(arguments)
    enqueue(job_instance)
    job_instance.object_id
end

def perform_in(arguments)
    time = arguments.delete_at(0)
    job_instance = JobInstance.new(arguments)
    delay(job_instance, time)
    job_instance.object_id
end

def execute(job_instance)
    begin 
        job_instance.run
    rescue
        job_instance.increment_fails
        puts "Task failed: #{job_instance.object_id}"
        delay(job_instance, 60) if job_instance.get_fails < 3 
    end 
end