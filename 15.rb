#!/usr/bin/env ruby

dir = [0, 1]*20
puts dir.permutation(40).to_a.uniq.size
