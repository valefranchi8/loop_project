# Ruby Concurrent Execution Queue

### Server

1. To start the server you should be located in te root project folder
2. Run the following command : `ruby server.rb`
3. The server can receive the following commands:
    1. `perform_now HelloWorldJob`
       This should show right away in the server log Hello World message
    2. `perform_now HelloMeJob first_name last_name`
       This should show right away in the server log Hello first_name last_name
    3. `perform_later HelloWorldJob`
       This job is added to the queue, so after all the previous jobs where executed, the message Hello World should be shown
    4. `perform_later HelloMeJob fist_name last_name`
       This job is added to the queue, so after all the previous jobs where executed, the message Hello first_name last_name should be shown
    5. `perform_in seconds HelloWorldJob`
       The message Hello World should be shown when those seconds passed as parameters have passed
    6. `perform_in seconds HelloMeJob first_name last_name`
       The message Hello first_name last_name should be shown when those seconds passed as parameters have passed
4. If the job passed does no exist, then the server log will be showing some logs, and the task will be added again      to the queue
5. To run the tests you should first `run gem install` rspec and after run each file with the following commands:
    1. `rspec spec/job_instance_spec.rb`
    2. `rspec spec/hello_me_job_spec.rb`
    3. `rspec spec/hello_world_job_spec.rb`


### Client

1. To start the client or many you should use the following command: `telnet localhost 2000`
2. The client can run the following commands once is connected to the server:
    1. `perform_now HelloWorldJob`
       This should return to the client > Hello World
    2. `perform_now HelloMeJob first_name last_name`
       This should return to the client > Hello first_name last_name
    3. `perform_later HelloWorldJob`
       This should return to the client > :id , this id is the one obtained by the job
    4. `perform_later HelloMeJob fist_name last_name`
       This should return to the client > :id , this id is the one obtained by the job
    5. `perform_in seconds HelloWorldJob`
       This should return to the client > :id , this id is the one obtained by the job
    6. `perform_in seconds HelloMeJob first_name last_name`
       This should return to the client > :id , this id is the one obtained by the job

### Solutions to Bonus problems
1. The Bonus problem i have included in the code is the one about the exception error. This could be tested with the ErrorJob class running the command: `(any perform command) ErrorJob` you will be able to test this functionality. It will print that the task, with its id, have failed 3 times. After that it will not be included in the queue anymore.

2. The perform_at problem:
   This implementation was not added to the code, but i will provide you with a solution a thought it could work. First i will get the system timestamp and save it to the JobInstance that is defined, after that i will add the job_instance (included this thimestamp) to the queue. When this task becomes the first element in the queue, before showing the results, the timestamp will be checked. If this time has already passed, then the job will be executed, if not it will be added at the end of the queue again.

3. The postpone problem:
   To solve this i should change the Queue structure i am using at the moment. I would implement a class queue myself,that contains the functions of pop, push, find element by id, and remove element by id. So when executing the postpone command with the corresponded id, i will use the function find element by id, and after finding that, remove that element from the queue. After this is completed, i would re use the function delay and pass to this the job_instance and the seconds that the postpone was required to.

### Author
Valentina Franchi
