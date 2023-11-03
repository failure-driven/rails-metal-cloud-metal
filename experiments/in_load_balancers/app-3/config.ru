application = lambda do |env|
  [
    200,
    {"content-type" => "text/plain; charset=utf-8;"},
    ["App-3 3️⃣  - #{Time.now.to_i}"]
  ]
end

run application
