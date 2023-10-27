#!/usr/bin/env ruby

require "digest"
require "json"

GOLDEN_SHA = "00000".freeze

block_chain = []
previous_hash = "0"

def calculate_hash(index, previous_hash, timestamp, data)
  nonce = -1
  hash = ""
  until hash.slice(0, GOLDEN_SHA.length) == GOLDEN_SHA
    nonce += 1
    hash = Digest::SHA2.hexdigest(
      index.to_s + previous_hash.to_s + timestamp.to_s + data + nonce.to_s
    )
  end
  [nonce, hash]
end

args = ARGV

# NOTE: allow a --locked-time for predictable output
start_offset = nil
if args[0] == "--locked-time"
  start_offset = Integer(args[1])
  2.times { args.shift }
end

args.each_with_index do |term, index|
  timestamp = start_offset || Time.now.to_i

  nonce, hash = calculate_hash(index, previous_hash, timestamp, term)
  block_chain << {
    index: index,
    previous_hash: previous_hash,
    timestamp: timestamp,
    data: term,
    nonce: nonce,
    hash: hash
  }
  puts JSON.pretty_generate(block_chain.last)
  previous_hash = hash
end

puts block_chain.to_json
