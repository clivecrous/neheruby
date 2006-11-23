#!/usr/bin/env ruby
# A basic environment. This simply waits for you to close the window, then
# exits.
require 'rubygame'

Rubygame.init

screen = Rubygame::Screen.set_mode [400,300], 32,
  Rubygame::HWSURFACE|Rubygame::OPENGL

screen.set_caption "neheruby - Lesson 1"

queue = Rubygame::Queue.instance
loop do
  queue.get.each do |event|
    case event
      when Rubygame::QuitEvent
        exit
    end
  end
  screen.update
end

