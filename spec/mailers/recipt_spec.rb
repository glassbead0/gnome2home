require "rails_helper"

RSpec.describe Recipt, :type => :mailer do
  describe "send_recipt" do
    let(:ticket) { FactoryGirl.create(:ticket)}
    let(:mail) { Recipt.send_recipt(ticket) }

    it "renders the headers" do
      expect(mail.subject).to eq("Gnome2Home recipt")
      expect(mail.to).to eq([ticket.email])
      expect(mail.from).to eq(["no-reply@gnome2home.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Thanks for riding Gnome2Home #{ticket.first_name}")
    end
  end

end
