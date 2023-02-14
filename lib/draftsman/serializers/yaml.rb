require 'yaml'

module Draftsman
  module Serializers
    module Yaml
      extend self # makes all instance methods become module methods as well

      def load(string)
        YAML.load string, permitted_classes: [Date, Time], aliases: true
      end

      def dump(object)
        YAML.dump object
      end
    end
  end
end
