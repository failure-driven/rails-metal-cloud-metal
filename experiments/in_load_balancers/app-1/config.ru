application = lambda do |env|
  puts env.inspect
  [
    200,
    {"content-type" => "text/plain; charset=utf-8;"},
    ["App-1 1️⃣  - #{Time.now.to_i}"]
  ]
end

run application
