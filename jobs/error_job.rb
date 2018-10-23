class ErrorJob
    def self.perform
        raise "Error"
    end
end