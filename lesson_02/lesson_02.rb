#!/usr/bin/env ruby
# A basic environment. This simply waits for you to close the window, then
# exits.
require 'rubygame'
require 'opengl'

WIDTH = 400
HEIGHT = 300

Rubygame.init

# Setup screen

screen = Rubygame::Screen.set_mode [WIDTH,HEIGHT], 32,
  Rubygame::HWSURFACE|Rubygame::OPENGL

screen.set_caption "neheruby - Lesson 2"

# Setup initial OpenGL

GL::Viewport 0, 0, WIDTH, HEIGHT

GL::MatrixMode GL::PROJECTION
GL::LoadIdentity()
GLU::Perspective 45, WIDTH/(HEIGHT.to_f), 3, 10

GL::MatrixMode GL::MODELVIEW
GL::LoadIdentity()

GL::Enable GL::DEPTH_TEST
GL::DepthFunc GL::LESS

# Main loop

queue = Rubygame::Queue.instance
loop do
  queue.get.each do |event|
    case event
      when Rubygame::QuitEvent
        exit
    end
  end

  GL::Clear GL::COLOR_BUFFER_BIT|GL::DEPTH_BUFFER_BIT
  GL::LoadIdentity()

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


  Rubygame::GL.swap_buffers
end

