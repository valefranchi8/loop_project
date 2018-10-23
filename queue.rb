@queue = Queue.new

def enqueue(job_instance)
    @queue << job_instance
end

def pop_job
    @queue.pop
end

def empty_queue
    @queue.empty?
end