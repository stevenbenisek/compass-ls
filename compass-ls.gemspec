# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
    s.name          = "compass-ls"
    s.date          = "2014-01-21"
    s.version       = "0.0.0"
    s.authors       = ["Steven Benisek"]
    s.email         = ["steven.benisek@gmail.com"]
    s.summary       = "A Compass plugin for listing the content of a directory"
    s.description   = s.summary
    s.homepage      = "https://github.com/stevenbenisek/compass-ls"
    s.license       = "MIT"

    s.files         = %w(README.md)
    s.files        += Dir.glob("lib/**/*.*")
    s.files        += Dir.glob("stylesheets/**/*.*")
    s.has_rdoc      = false
    s.add_dependency("sass", [">=3.2.0"])
    s.add_dependency("compass", [">= 0.12.1"])
end
