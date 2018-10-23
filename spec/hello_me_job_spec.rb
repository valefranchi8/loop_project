require "rspec"
require "./jobs/hello_me_job.rb"

describe HelloMeJob do
    describe ".perform" do
        context "When receives 2 arguments" do
            it "returns a complete hello message" do
                expect(HelloMeJob.perform(["Valentina", "Franchi"])).to eq("Hello Valentina Franchi")
            end
        end

        context "When receives less than 2 arguments" do
            it "returns a hello message" do
                expect(HelloMeJob.perform(["Valentina"])).to eq("Hello Valentina ")
            end
        end

        context "When receives more than 2 arguments" do
            it "returns a hello message ignoring the last arguments" do
                expect(HelloMeJob.perform(["Valentina", "Franchi", "Fabio"])).to eq("Hello Valentina Franchi")
            end
        end

    end
end