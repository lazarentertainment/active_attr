require "spec_helper"
require "active_attr/typecasting/time_typecaster"

module ActiveAttr
  module Typecasting
    describe TimeTypecaster do
      subject(:typecaster) { described_class.new }

      describe "#call" do

        it "returns nil for nil" do
          typecaster.call(nil).should equal nil
        end

        it "casts a Date to a Time at the beginning of the day with no offset" do
          result = typecaster.call(Date.new(2012, 1, 1))
          result.should eql Time.new(2012, 1, 1)
          result.should be_instance_of Time
        end

        it "casts a UTC Time to a Time with no offset" do
          result = typecaster.call(Time.utc(2012, 1, 1, 12, 0, 0))
          result.should eql Time.new(2012, 1, 1, 12, 0, 0, 0)
          result.should be_instance_of Time
        end

        it "casts a local Time to a Time with a matching offset" do
          value = Time.local(2012, 1, 1, 12, 0, 0)
          result = typecaster.call(value)
          result.should eql Time.new(2012, 1, 1, 12, 0, 0).utc
          result.should be_instance_of Time
        end

        it "casts an ISO8601 date String to a Date" do
          result = typecaster.call("2012-01-01T12:00:00Z")
          puts result
          result.should eql Time.new(2012, 1, 1, 12, 0, 0, "+00:00").utc
          result.should be_instance_of Time
        end

      end
    end
  end
end
