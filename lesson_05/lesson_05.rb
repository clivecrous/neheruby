#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

require '../nehe'

class Lesson05 < Display

  def initialize width, height
    super width, height, "Lesson 5"

    @angle_triangle = 0
    @angle_quads = 0
  end

  def render_pyramid
    GL::Begin GL::TRIANGLES
          GL::Color 1,0,0
          GL::Vertex  0, 1, 0
          GL::Color 0,1,0
          GL::Vertex -1,-1, 1
          GL::Color 0,0,1
          GL::Vertex  1,-1, 1

          GL::Color 1,0,0
          GL::Vertex  0, 1, 0
          GL::Color 0,0,1
          GL::Vertex  1,-1, 1
          GL::Color 0,1,0
          GL::Vertex  1,-1,-1

          GL::Color 1,0,0
          GL::Vertex  0, 1, 0
          GL::Color 0,1,0
          GL::Vertex  1,-1,-1
          GL::Color 0,0,1
          GL::Vertex -1,-1,-1

          GL::Color 1,0,0
          GL::Vertex  0, 1, 0
          GL::Color 0,0,1
          GL::Vertex -1,-1,-1
          GL::Color 0,1,0
          GL::Vertex -1,-1, 1
    GL::End()
  end

  def render_cube
    GL::Begin GL::QUADS
          GL::Color 0,1,0
          GL::Vertex  1, 1,-1
          GL::Vertex -1, 1,-1
          GL::Vertex -1, 1, 1
          GL::Vertex  1, 1, 1

          GL::Color 1,0.5,0
          GL::Vertex  1,-1,-1
          GL::Vertex -1,-1,-1
          GL::Vertex -1,-1, 1
          GL::Vertex  1,-1, 1

          GL::Color 1,0,0
          GL::Vertex  1, 1, 1
          GL::Vertex -1, 1, 1
          GL::Vertex -1,-1, 1
          GL::Vertex  1,-1, 1

          GL::Color 1,1,0
          GL::Vertex  1, 1,-1
          GL::Vertex -1, 1,-1
          GL::Vertex -1,-1,-1
          GL::Vertex  1,-1,-1

          GL::Color 0,0,1
          GL::Vertex -1, 1, 1
          GL::Vertex -1, 1,-1
          GL::Vertex -1,-1,-1
          GL::Vertex -1,-1, 1

          GL::Color 1,0,1
          GL::Vertex  1, 1, 1
          GL::Vertex  1, 1,-1
          GL::Vertex  1,-1,-1
          GL::Vertex  1,-1, 1
    GL::End()
  end

  def render_objects
    GL::Translate -1.5, 0, -6

    GL::Rotate @angle_triangle,0,1,0

    render_pyramid

    GL::LoadIdentity()
    GL::Translate 1.5,0,-6

    GL::Rotate @angle_quads,1,0,0

    render_cube

    @angle_triangle += 0.2
    @angle_quads += 0.15
  end

end

Lesson05.new( 400, 300 ).run
