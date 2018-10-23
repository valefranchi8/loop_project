# Ruby Concurrent Execution Queue

### Server

1. To start the server you should be located in te root project folder
2. Run the following command : ruby server.rb
3. The server can receive the following commands:
    a. perform_now HelloWorldJob
       This should show right away in the server log Hello World message
    b. perform_now HelloMeJob first_name last_name
       This should show right away in the server log Hello first_name last_name
    c. perform_later HelloWorldJob
       This job is added to the queue, so after all the previous jobs where executed, the message Hello World should be shown
    d. perform_later HelloMeJob fist_name last_name
       This job is added to the queue, so after all the previous jobs where executed, the message Hello first_name last_name should be shown
    e. perform_in seconds HelloWorldJob
       The message Hello World should be shown when those seconds passed as parameters have passed
    f. perform_in seconds HelloMeJob first_name last_name
       The message Hello first_name last_name should be shown when those seconds passed as parameters have passed
4. If the job passed does no exist, then the server log will be showing some logs, and the task will be added again      to the queue
5. To run the tests you should first run gem install rspec and after run each file with the following commands:
    a. rspec spec/job_instance_spec.rb
    b. rspec spec/hello_me_job_spec.rb
    c. rspec spec/hello_world_job_spec.rb


### Client

1. To start the client or many you should use the following command: telnet localhost 2000
2. The client can run the following commands once is connected to the server:
    a. perform_now HelloWorldJob
       This should return to the client > Hello World
    b. perform_now HelloMeJob first_name last_name
       This should return to the client > Hello first_name last_name
    c. perform_later HelloWorldJob
       This should return to the client > :id , this id is the one obtained by the job
    d. perform_later HelloMeJob fist_name last_name
       This should return to the client > :id , this id is the one obtained by the job
    e. perform_in seconds HelloWorldJob
       This should return to the client > :id , this id is the one obtained by the job
    f. perform_in seconds HelloMeJob first_name last_name
       This should return to the client > :id , this id is the one obtained by the job

### Solutions to Bonus problems
1. The Bonus problem i have included in the code is the one about the exception error. This could be tested with the ErrorJob class running the command: perform_now ErrorJob you will be able to test this functionality. It will print that the task, with its id, have failed 3 times. After that it will not be included in the queue anymore.

2. The perform_at problem:
   This implementation was not added to the code, but i will provide you with a solution a thought it could work. First i will get the system timestamp, after that i will add the job_arguments (included this thimestamp) to the queue. When this task becomes the first element in the queue, before showing the results, the timestamp will be checked. If this time has already passed, then the job will be executed, if not it will be added at the end of the queue again.

3. The postpone problem:
   To solve this i should change the Queue structure i am using at the moment. I would implement a class queue myself,that contains the functions of pop, push, find element by id, and remove element by id. So whe executing the postpone command with the corresponded id, i will use the function find element by id, and after finding that, remove that element from the queue. After this is completed, i would re use the function delay and pass to this the job_instance and the seconds that the postpone was required to.

### Author
Valentina Franchi
