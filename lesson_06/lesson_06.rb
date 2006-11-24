#!/usr/bin/env ruby
require 'rubygame'
require 'opengl'

require 'basecode/nehe'

class Lesson06 < Display

  def initialize width, height
    super width, height, "Lesson 6"

    @xrot = 0
    @yrot = 0
    @zrot = 0
  end

  def gl_setup
    super

    loadGLtextures

    GL::Enable GL::TEXTURE_2D
    GL::ShadeModel GL::SMOOTH

  end

  def loadGLtextures
    texture = Rubygame::Image.load("data/nehe.bmp")

    @textures = GL::GenTextures 1

    GL::BindTexture GL::TEXTURE_2D, @textures[0]

    GL::TexImage2D GL::TEXTURE_2D, 0, GL::RGB, texture.w, texture.h, 0, GL::BGR,
                   GL::UNSIGNED_BYTE, texture.pixels

    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER,GL::LINEAR
    GL::TexParameter GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER,GL::LINEAR
  end

  def render_cube
    GL::BindTexture GL::TEXTURE_2D, @textures[0]

    GL::Begin GL::QUADS
          GL::TexCoord 0, 1
          GL::Vertex -1,-1, 1
          GL::TexCoord 1, 1
          GL::Vertex  1,-1, 1
          GL::TexCoord 1, 0
          GL::Vertex  1, 1, 1
          GL::TexCoord 0, 0
          GL::Vertex -1, 1, 1

          GL::TexCoord 0, 0
          GL::Vertex -1,-1,-1
          GL::TexCoord 0, 1
          GL::Vertex -1, 1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1, 1,-1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1,-1

          GL::TexCoord 1, 1
          GL::Vertex -1, 1,-1
          GL::TexCoord 1, 0
          GL::Vertex -1, 1, 1
          GL::TexCoord 0, 0
          GL::Vertex  1, 1, 1
          GL::TexCoord 0, 1
          GL::Vertex  1, 1,-1

          GL::TexCoord 0, 1
          GL::Vertex -1,-1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1,-1,-1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1, 1
          GL::TexCoord 0, 0
          GL::Vertex -1,-1, 1

          GL::TexCoord 0, 0
          GL::Vertex  1,-1,-1
          GL::TexCoord 0, 1
          GL::Vertex  1, 1,-1
          GL::TexCoord 1, 1
          GL::Vertex  1, 1, 1
          GL::TexCoord 1, 0
          GL::Vertex  1,-1, 1

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
    GL::Translate 0, 0, -6

    GL::Rotate @xrot, 1, 0, 0
    GL::Rotate @yrot, 0, 1, 0
    GL::Rotate @zrot, 0, 0, 1

    render_cube

    @xrot += 0.3
    @yrot += 0.2
    @zrot += 0.4
  end

end

Lesson06.new( 400, 300 ).run
