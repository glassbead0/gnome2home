class ContactController < ApplicationController
  def index

  end

  def send_feedback
    Feedback.passenger_feedback(params[:full_name], params[:phone], params[:email], params[:message]).deliver
    redirect_to contact_path, notice: 'Thanks for contacting us. We will respond shortly if your concern requires a response'
  end
end
