#!/usr/bin/env ruby

require 'json'

inp = $stdin.read

obj = JSON.parse(inp)

puts obj
