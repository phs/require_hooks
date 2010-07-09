require 'active_support/dependencies'
require 'active_support/lazy_load_hooks'
require 'active_support/core_ext/module/aliasing'
require 'active_support/core_ext/module/delegation'

module ActiveSupport
  module Dependencies

    def before_require(file_name, &block)
      resolved = search_for_file(file_name) || file_name
      ActiveSupport.on_load("before_#{resolved}", :yield => true, &block)
    end

    def after_require(file_name, &block)
      resolved = search_for_file(file_name) || file_name
      ActiveSupport.on_load("after_#{resolved}", :yield => true, &block)
    end

    def require_or_load_with_load_hooks(file_name)
      resolved = search_for_file(file_name) || file_name
      ActiveSupport.run_load_hooks("before_#{resolved}")
      require_or_load_without_load_hooks(file_name)
      ActiveSupport.run_load_hooks("after_#{resolved}")
    end

    alias_method_chain :require_or_load, :load_hooks

    module Loadable
      delegate :before_require, :after_require, :to => Dependencies
    end
  end
end
