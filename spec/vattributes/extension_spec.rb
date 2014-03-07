require 'spec_helper'

describe Vattributes::Extension do
  subject { User.new }

  describe "getter" do
    it "responds to the getter" do
      expect(subject).to respond_to(:email)
      expect(subject).to respond_to(:nickname)
    end

    it "calls the #vattribute_get with the correct param" do
      expect(subject).to receive(:vattribute_get).with(:email)
      subject.email
    end
  end

  describe "setter" do
    it "responds to the setter" do
      expect(subject).to respond_to(:email=)
      expect(subject).to respond_to(:nickname=)
    end

    it "calls the #vattribute_set with the correct param" do
      expect(subject).to receive(:vattribute_set).with(:email, 'value')
      subject.email = 'value'
    end
  end

  describe "#virtual_attributes" do
    it "returns a hash" do
      expect(subject.virtual_attributes).to eq({})
    end
  end

  describe "#vattribute_set" do
    subject { User.create(name: 'name', email: 'email') }

    it "sets the correct attributes and persist the data" do
      subject.reload
      expect(subject.name).to eq('name')
      expect(subject.email).to eq('email')
    end
  end
end
