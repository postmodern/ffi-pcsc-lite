require 'spec_helper'
require 'ffi/pcsc/lite'

describe FFI::Pcsc::Lite do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
