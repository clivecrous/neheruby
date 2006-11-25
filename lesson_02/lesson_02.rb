#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

require 'basecode/nehe'

class Lesson02 < Display
  def render_objects
    GL::Translate -1.5, 0, -6

    GL::Begin GL::TRIANGLES
          GL::Vertex  0, 1,0
          GL::Vertex -1,-1,0
          GL::Vertex  1,-1,0
    GL::End()

    GL::Translate 3,0,0

    GL::Begin GL::QUADS
          GL::Vertex -1, 1,0
          GL::Vertex  1, 1,0
          GL::Vertex  1,-1,0
          GL::Vertex -1,-1,0
    GL::End()
  end
end

Lesson02.new( "Lesson 2" ).run
