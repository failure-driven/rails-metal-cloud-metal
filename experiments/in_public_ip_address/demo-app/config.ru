application = lambda do |env|
  puts env.to_h.slice("QUERY_STRING", "REQUEST_PATH", "HTTP_HOST", "SERVER_NAME", "SERVER_PORT")
  [
    200,
    {"content-type" => "text/plain; charset=utf-8;"},
    ["App-1 1️⃣  - #{Time.now.to_i}"]
  ]
end

run application
