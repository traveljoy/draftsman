require 'yaml'

module Draftsman
  module Serializers
    module Yaml
      extend self # makes all instance methods become module methods as well

      def load(string)
        if at_least_ruby_3_1?
          YAML.load string, permitted_classes: [Date, Time, BigDecimal, ActiveSupport::TimeWithZone], aliases: true
        else
          YAML.load string
        end
      end

      def dump(object)
        YAML.dump object
      end

      def at_least_ruby_3_1?
        major, minor, _patch = RUBY_VERSION.split(".").map(&:to_i)
        (major >= 3 && minor >= 1) || major > 3
      end
    end
  end
end
