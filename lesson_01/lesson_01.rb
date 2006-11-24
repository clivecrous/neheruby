#!/usr/bin/env ruby
# A basic environment. This simply waits for you to close the window, then
# exits.
require 'rubygame'
require 'opengl'

require '../nehe'

Display.new( 400,300, "Lesson 1" ).run
