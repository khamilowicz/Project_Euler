#!/usr/bin/env ruby
# encoding: utf-8

=begin rdoc
	You are given the following information, but you may prefer to do some research for yourself.

	1 Jan 1900 was a Monday.
	Thirty days has September,
	April, June and November.
	All the rest have thirty-one,
	Saving February alone,
	Which has twenty-eight, rain or shine.
	And on leap years, twenty-nine.
	A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
	How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=end

days = %w{mon tue wed thu fri sat sun}
months = %w{jan feb mar apr may jun jul aug sep oct nov dec}
mondays = 0

(1900..2000).each do |year|

  months.each do |month|

    m_dur = case
      when %w{sep apr jun nov}.include?(month) 
        30 
      when month == "feb" 
        if year%400 == 0 && year%1000 == 0
          29 
        elsif year%1000 == 0
          28 
        elsif year%4 == 0
          29 
        else
          28
        end
      else 
        31
      end

    (1..m_dur).each do |day|
      days.rotate!
      mondays += 1 if day==1 && days.first == 'mon' && year != 1900
    end
  end
end

puts mondays
