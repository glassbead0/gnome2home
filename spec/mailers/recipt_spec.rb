require "rails_helper"

RSpec.describe Recipt, :type => :mailer do
  describe "send_recipt" do
    let(:mail) { Recipt.send_recipt }

    it "renders the headers" do
      expect(mail.subject).to eq("Send recipt")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
