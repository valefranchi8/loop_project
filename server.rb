require "socket"  
require "./io_aux.rb"
require "./queue.rb"
require "./perform.rb"

Thread.new do 
    loop do
        next if empty_queue
        execute(pop_job)
    end
end

listener = TCPServer.new('127.0.0.1', 2000)  
loop do  
    Thread.start(listener.accept) do |client|  
        serve(client)
    end  
end