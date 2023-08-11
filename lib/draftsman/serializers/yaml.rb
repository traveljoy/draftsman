require 'yaml'

module Draftsman
  module Serializers
    module Yaml
      extend self # makes all instance methods become module methods as well

      def load(string)
        if RUBY_VERSION.start_with?('3.')
          YAML.load string, permitted_classes: [Date, Time, BigDecimal], aliases: true
        else
          YAML.load string
        end
      end

      def dump(object)
        YAML.dump object
      end
    end
  end
end
