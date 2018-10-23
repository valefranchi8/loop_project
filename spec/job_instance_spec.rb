require "rspec"
require "./jobs/job_instance.rb"

describe JobInstance do
    describe ".new" do
        it "initializes a new job instance for the given job" do
            expect(JobInstance.new(["HelloWorldJob"]).instance_variable_get(:@job)).to eq("HelloWorldJob")
        end
    end

    describe ".run" do
        context "when the job exists" do
            let(:job_instance) { JobInstance.new(["HelloWorldJob"]) }
            it "executes job" do
                expect(HelloWorldJob).to receive(:perform)
                job_instance.run
            end
        end

        context "when the job does not exist" do
            let(:job_instance) { JobInstance.new(["NotExistJob"]) }
            it "returns a message that the job does not exist" do
                expect(job_instance.run).to eq("The job does not exist")
            end
        end
    end

    describe ".increment_fails" do
        let(:job_instance) { JobInstance.new }
        it "increments the number of fails" do
            expect {job_instance.increment_fails}.to change {job_instance.instance_variable_get(:@fails)}
                .from(0).to(1)
        end
    end

    describe ".get_fails" do
        let(:job_instance) { JobInstance.new }
        it "returns the number of fails" do
            expect(job_instance.get_fails).to eq(job_instance.instance_variable_get(:@fails))
        end
    end
end