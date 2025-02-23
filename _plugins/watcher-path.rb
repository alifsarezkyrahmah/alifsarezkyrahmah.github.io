require 'jekyll-watch'

module Jekyll
  module Watcher
    extend self

    if self.respond_to?(:listen_ignore_paths)
      alias original_listen_ignore_paths listen_ignore_paths

      def listen_ignore_paths(options)
        original_listen_ignore_paths(options) + [%r!.*\.TMP!i]
      end
    end
  end
end
