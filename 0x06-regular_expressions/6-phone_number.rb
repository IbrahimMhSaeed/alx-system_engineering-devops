#!/usr/bin/env ruby
puts ARGV[0].scan(/(?<!\s)\b[0-9]{10}\b(?!\s)/).join
