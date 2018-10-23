require "rspec"
require "./jobs/hello_world_job.rb"

describe HelloWorldJob do
    describe ".perform" do
        it "returns a Hello World message" do
            expect(HelloWorldJob.perform).to eq("Hello World")
        end
    end
end