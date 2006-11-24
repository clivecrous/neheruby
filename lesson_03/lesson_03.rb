#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

require '../nehe'

class Lesson03 < Display
  def render_objects
    GL::Translate -1.5, 0, -6

    GL::Begin GL::TRIANGLES
          GL::Color 1,0,0
          GL::Vertex  0, 1,0
          GL::Color 0,1,0
          GL::Vertex -1,-1,0
          GL::Color 0,0,1
          GL::Vertex  1,-1,0
    GL::End()

    GL::Translate 3,0,0

    GL::Color 0.5,0.5,1
    GL::Begin GL::QUADS
          GL::Vertex -1, 1,0
          GL::Vertex  1, 1,0
          GL::Vertex  1,-1,0
          GL::Vertex -1,-1,0
    GL::End()
  end
end

Lesson03.new( 400, 300, "Lesson 3" ).run
