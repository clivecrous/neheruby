#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

WIDTH = 400
HEIGHT = 300

Rubygame.init

# Setup screen

screen = Rubygame::Screen.set_mode [WIDTH,HEIGHT], 32,
  Rubygame::HWSURFACE|Rubygame::OPENGL

screen.set_caption "neheruby - Lesson 5"

# Setup initial OpenGL

GL::Viewport 0, 0, WIDTH, HEIGHT

GL::MatrixMode GL::PROJECTION
GL::LoadIdentity()
GLU::Perspective 45, WIDTH/(HEIGHT.to_f), 3, 10

GL::MatrixMode GL::MODELVIEW
GL::LoadIdentity()

GL::Enable GL::DEPTH_TEST
GL::DepthFunc GL::LESS

# Rotation variables

$rrti = 0
$rquad = 0

# Main loop

queue = Rubygame::Queue.instance
loop do
  queue.get.each do |event|
    case event
      when Rubygame::QuitEvent
        exit
      #when Rubygame::KeyDownEvent
      # case event.key
      # when Rubygame::K_F1
      #    FIXME Rubygame does not yet support fullscreen toggle inately
    end
  end

  GL::Clear GL::COLOR_BUFFER_BIT|GL::DEPTH_BUFFER_BIT

  GL::LoadIdentity()
  GL::Translate -1.5, 0, -6
  GL::Rotate $rrti,0,1,0

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

  GL::LoadIdentity()
  GL::Translate 1.5,0,-6
  GL::Rotate $rquad,1,0,0

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

  $rrti += 0.2
  $rquad += 0.15

  Rubygame::GL.swap_buffers
end

