require "active_support/core_ext/string/conversions"
require "active_support/time"

module ActiveAttr
  module Typecasting
    # Typecasts an Object to a String
    #
    # @example Usage
    #   TypeTypecaster.new.call("2016-05-19T19:19:08Z") #=> 2016-05-19 19:19:52 UTC
    #
    class TimeTypecaster
      # Typecasts an object to a Time
      #
      # Attempts to convert using #to_time.utc.
      #
      # @example Typecast a String
      #   typecaster.call("2016-05-19T19:19:08Z") #=> 2016-05-19 19:19:52 UTC
      #
      # @param [Object, #to_datetime] value The object to typecast
      #
      # @return [DateTime, nil] The result of typecasting
      #
      def call(value)
        value.to_time.utc if (value.respond_to?(:to_time) && value.to_time.respond_to?(:utc))
      end
    end
  end
end
