#!/usr/bin/env ruby
# A basic environment. This simply waits for you to close the window, then
# exits.
require 'rubygame'
require 'opengl'

class Display

  WIDTH = 640
  HEIGHT = 480

  def initialize caption, flags=0, width=WIDTH, height=HEIGHT
    @width = width
    @height = height

    Rubygame.init

    @screen = Rubygame::Screen.set_mode [@width,@height], 32,
      Rubygame::HWSURFACE|Rubygame::OPENGL|flags

    @screen.set_caption "NeHe Ruby - " + caption

    gl_setup
  end
  def gl_setup
    GL::Viewport 0, 0, @width, @height

    GL::MatrixMode GL::PROJECTION
    GL::LoadIdentity()
    GLU::Perspective 45, @width/(@height.to_f), 3, 10

    GL::MatrixMode GL::MODELVIEW
    GL::LoadIdentity()

    GL::Enable GL::DEPTH_TEST
    GL::DepthFunc GL::LESS
  end
  def run
    queue = Rubygame::Queue.instance
    loop do
      queue.get.each do |event|
        case event
          when Rubygame::KeyDownEvent
            case event.key
              when Rubygame::K_ESCAPE
                exit
              when Rubygame::K_Q
                exit
            end
          when Rubygame::QuitEvent
            exit
        end
      end
      render_scene
    end
  end
  def render_scene
    GL::Clear GL::COLOR_BUFFER_BIT|GL::DEPTH_BUFFER_BIT
    GL::LoadIdentity()

    render_objects

    Rubygame::GL.swap_buffers
  end
  def render_objects
  end
end
