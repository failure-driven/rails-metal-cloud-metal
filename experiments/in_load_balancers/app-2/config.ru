application = lambda do |env|
  [
    200,
    {"content-type" => "text/plain; charset=utf-8;"},
    ["App-2 2️⃣  - #{Time.now.to_i}"]
  ]
end

run application
