class InvitationMailer < ActionMailer::Base
  def invitation(invitation)
    @invitation = invitation

    mail(:to => invitation.email,
      :from => "Lobsters Invitation <no-reply@antinews.nushackers.org>",
      subject: "[Antinews] Welcome to Antinews")
  end
end
