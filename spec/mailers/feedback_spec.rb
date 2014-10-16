require "rails_helper"

RSpec.describe Feedback, :type => :mailer do
  describe "passenger_feedback" do
    let(:mail) { Feedback.passenger_feedback('Fred Kapinos', '1234567890', 'fred@example.com', 'hi, this is my feedback message') }

    it "renders the headers" do
      expect(mail.subject).to eq("Passenger feedback")
      expect(mail.to).to eq(["glassbead@gmail.com"])
      expect(mail.from).to eq(["gnome2home_contact_form@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("From: Fred Kapinos")
      expect(mail.body.encoded).to match("Email: fred@example.com")
      expect(mail.body.encoded).to match("Phone: 1234567890")
      expect(mail.body.encoded).to match("hi, this is my feedback message")
    end
  end

end
