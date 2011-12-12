$:.unshift File.dirname(__FILE__)
require 'helper'

describe GagaCommit do

  before do
    @record1 = {
      "id"=>"ce859b3eb91e205e3eb4e5afd08a89cb829a5033",
      "parents"=>[{"id"=>"c4ed9fbb6a9f4f28d8c735f95ddd4350a910b8f5"}],
      "tree"=>"34d6127bea6e7d56c272b719a70081be1d944282",
      "message"=>"set 'Page:27:main'",
      "author"=>{"name"=>"admin", "email"=>"admin@local.host"},
      "committer"=>{"name"=>"admin", "email"=>"admin@local.host"},
      "authored_date"=>"2011-12-08T13:01:08-05:00",
      "committed_date"=>"2011-12-08T13:01:08-05:00"
    }
    
    @entry = GagaCommit.new(@record1)
  end
  
  it "initilizes returns a DateTime for committed_date" do
    @entry.committed_date.must_equal Time.parse(@record1['committed_date'])
  end
  
  it "initilizes returns a DateTime for authored_date" do
    @entry.authored_date.must_equal Time.parse(@record1['authored_date'])
  end
  
  it "returns correct data via method_missing" do
    %w(id parents tree message author committer).each do |mthd|
      @entry.send(mthd).must_equal @record1[mthd]
    end
  end
  
  it "returns correct data via [] using string keys" do
    @record1.keys.each do |key|
      @entry[key].must_equal @record1[key]
    end
  end
  
  it "returns correct data via [] using symbol keys" do
    @record1.keys.each do |key|
      @entry[key.to_sym].must_equal @record1[key]
    end
  end
end