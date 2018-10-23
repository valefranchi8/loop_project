class HelloMeJob
    def self.perform(*args)
        args = args.flatten
        "Hello #{args[0]} #{args[1]}"
    end
end