#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

require 'basecode/nehe'

class Lesson08 < Display

  def initialize flags=0, width=Display::WIDTH, height=Display::HEIGHT
    super "Lesson 7", flags, width, height

    @xrot = 0
    @yrot = 0
    @xrot_delta = 0
    @yrot_delta = 0
    @zoom=5.0

    @filter = 0

    @light = false
  end

  def gl_setup
    super

    loadGLtextures

    GL::Enable GL::TEXTURE_2D
    GL::ShadeModel GL::SMOOTH

    GL::Light GL::LIGHT1, GL::AMBIENT, [ 0.5, 0.5, 0.5, 1.0 ]
    GL::Light GL::LIGHT1, GL::DIFFUSE, [ 1.0, 1.0, 1.0, 1.0 ]
    GL::Light GL::LIGHT1, GL::POSITION, [ 0.0, 0,0, 2.0, 1.0 ]

    GL::Enable GL::LIGHT1

  end

  def loadGLtextures
    texture = Rubygame::Image.load("data/glass.bmp")

    @textures = GL::GenTextures 3

    GL::BindTexture GL::TEXTURE_2D, @textures[0]

    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER,GL::NEAREST
    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER,GL::NEAREST

    GL::TexImage2D GL::TEXTURE_2D, 0, GL::RGB, texture.w, texture.h, 0, GL::BGR,
                   GL::UNSIGNED_BYTE, texture.pixels

    GL::BindTexture GL::TEXTURE_2D, @textures[1]

    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER,GL::LINEAR
    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER,GL::LINEAR

    GL::TexImage2D GL::TEXTURE_2D, 0, GL::RGB, texture.w, texture.h, 0, GL::BGR,
                   GL::UNSIGNED_BYTE, texture.pixels

    GL::BindTexture GL::TEXTURE_2D, @textures[2]

    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER,
      GL::LINEAR_MIPMAP_NEAREST
    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER,GL::LINEAR

    GLU::Build2DMipmaps GL::TEXTURE_2D, GL::RGB, texture.w, texture.h, GL::BGR,
                   GL::UNSIGNED_BYTE, texture.pixels
  end

  def render_cube
    GL::BindTexture GL::TEXTURE_2D, @textures[ @filter ]

    GL::Begin GL::QUADS
          GL::Normal 0,0,1
          GL::TexCoord 0, 1
          GL::Vertex -1,-1, 1
          GL::TexCoord 1, 1
          GL::Vertex  1,-1, 1
          GL::TexCoord 1, 0
          GL::Vertex  1, 1, 1
          GL::TexCoord 0, 0
          GL::Vertex -1, 1, 1

          GL::Normal 0,0,-1
          GL::TexCoord 0, 0
          GL::Vertex -1,-1,-1
          GL::TexCoord 0, 1
          GL::Vertex -1, 1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1, 1,-1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1,-1
          
          GL::Normal 0,1,0
          GL::TexCoord 1, 1
          GL::Vertex -1, 1,-1
          GL::TexCoord 1, 0
          GL::Vertex -1, 1, 1
          GL::TexCoord 0, 0
          GL::Vertex  1, 1, 1
          GL::TexCoord 0, 1
          GL::Vertex  1, 1,-1

          GL::Normal 0,-1,0
          GL::TexCoord 0, 1
          GL::Vertex -1,-1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1,-1,-1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1, 1
          GL::TexCoord 0, 0
          GL::Vertex -1,-1, 1

          GL::Normal 1,0,0
          GL::TexCoord 0, 0
          GL::Vertex  1,-1,-1
          GL::TexCoord 0, 1
          GL::Vertex  1, 1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1, 1, 1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1, 1

          GL::Normal -1,0,0
          GL::TexCoord 1, 0
          GL::Vertex -1,-1,-1
          GL::TexCoord 0, 0
          GL::Vertex -1,-1, 1
          GL::TexCoord 0, 1
          GL::Vertex -1, 1, 1
          GL::TexCoord 1, 1
          GL::Vertex -1, 1,-1
    GL::End()
  end

  def render_objects
    GL::Translate 0, 0, -@zoom

    GL::Rotate @xrot, 1, 0, 0
    GL::Rotate @yrot, 0, 1, 0

    render_cube

    @xrot += @xrot_delta
    @yrot += @yrot_delta
  end

  def event_handler event
    super

    case event
      when Rubygame::KeyDownEvent
        case event.key
          when Rubygame::K_DOWN
            @xrot_delta+=0.1
          when Rubygame::K_UP
            @xrot_delta-=0.1
          when Rubygame::K_RIGHT
            @yrot_delta+=0.1
          when Rubygame::K_LEFT
            @yrot_delta-=0.1
          when Rubygame::K_PAGEUP
            @zoom-=0.1
          when Rubygame::K_PAGEDOWN
            @zoom+=0.1
          when Rubygame::K_L
            @light = !@light
            if @light
              GL::Enable GL::LIGHTING
            else
              GL::Disable GL::LIGHTING
            end
          when Rubygame::K_F
            @filter = ( @filter + 1) % 3
        end
    end
  end

end

Lesson08.new.run
