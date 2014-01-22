# List required gems
require "compass"

# Register extension and provide location
extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register("compass-ls", :path => extension_path)

# Custom SassScript
module Sass::Script::Functions
    def x_compass_ls(files, suffix)
        files = files.value
        suffix = suffix.value
        suffix = suffix ? '.*' : ''
        return Sass::Script::List.new(
            Dir.glob(files).map! { |x| Sass::Script::String.new(File.basename(x, suffix)) },
            :comma
        )
    end
end
