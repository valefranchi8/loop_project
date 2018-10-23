require "./perform.rb"

def parse(line)
    line.split(' ')
end

def run(line)
    arguments = parse(line)
    send("#{arguments.delete_at(0)}", arguments)
end

def serve(client)
    loop do
        result = run(client.gets)
        client.puts "> #{result}"
    end
end