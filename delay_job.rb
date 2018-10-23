require "./queue.rb"

def delay(job_instance, time)
    Thread.new do
        sleep(time.to_i)
        enqueue(job_instance)
    end
end

