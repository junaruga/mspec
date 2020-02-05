require 'spec_helper'
require 'mspec/expectations/expectations'
require 'mspec/matchers'
require 'socket'

describe BlockingMatcher do
  it 'matches when a Proc blocks the caller' do
    BlockingMatcher.new.matches?(proc { sleep }).should == true
  end

  it 'does not match when a Proc does not block the caller' do
    BlockingMatcher.new.matches?(proc { 1 }).should == false
  end

  it 'does not match when the Proc Socket.ip_address_list does not block the caller' do
    BlockingMatcher.new.matches?(proc { Socket.ip_address_list }).should == false
  end
end
