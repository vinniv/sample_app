require 'spec_helper'

module RSpec
  module Mocks
    describe "A chained method stub" do
      before(:each) do
        @subject = Object.new
      end

      it "returns expected value from chaining only one method call" do
        @subject.stub_chain(:msg1).and_return(:return_value)
        @subject.msg1.should equal(:return_value)
      end

      it "returns expected value from chaining two method calls" do
        @subject.stub_chain(:msg1, :msg2).and_return(:return_value)
        @subject.msg1.msg2.should equal(:return_value)
      end

      it "returns expected value from chaining four method calls" do
        @subject.stub_chain(:msg1, :msg2, :msg3, :msg4).and_return(:return_value)
        @subject.msg1.msg2.msg3.msg4.should equal(:return_value)
      end

      it "returns expected value from chaining four method calls twice with some shared" do
        @subject.stub_chain(:msg1, :msg2, :msg3, :msg4).and_return(:first)
        @subject.stub_chain(:msg5, :msg2, :msg3, :msg4).and_return(:second)

        @subject.msg1.msg2.msg3.msg4.should equal(:first)
        @subject.msg5.msg2.msg3.msg4.should equal(:second)
      end
    end
  end
end
