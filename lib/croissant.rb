require 'imgkit'
require 'asciiart'
require 'tempfile'

module Croissant
  class Engine

    def initialize(source)
      @source = source
    end

    def render
      img_path = create_image
      format_ascii(img_path)
    end

    private

    def format_ascii(img_path)
      ascii = "<!DOCTYPE html><html><head></head><body class='ascii-page' style='font-size: 5px'>"
      ascii << AsciiArt.new(img_path).
        to_ascii_art(format: 'html', width: 400, color: true)
      ascii << "</body></html>"

      ascii
    end

    def create_image
      img = IMGKit.new(@source)
      img_file = Tempfile.new('foo', encoding: 'ascii-8bit')
      img_file.write(img.to_png)
      img_file.close
      img_file.path
    end
  end
end

Mime::Type.register "text/ascii", :ascii, [], %w( html )

ActionController::Renderers.add :ascii do |filename, options|
  options[:formats] = :html
  ascii = ::Croissant::Engine.new(render_to_string(options)).render
  render text: ascii, content_type: content_type
end
