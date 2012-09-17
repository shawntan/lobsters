class EmailReply < ActionMailer::Base
  default :from => "nobody@lobste.rs"

  def reply(comment, user)
    @comment = comment 
    @user = user

    mail(:to => user.email, :from => "Antinews <no-reply@antinews.nushackers.org",
      :subject => "[Antinews] Reply from #{comment.user.username} on " <<
      "#{comment.story.title}")
  end

  def mention(comment, user)
    @comment = comment 
    @user = user

    mail(:to => user.email, :from => "Antinews <no-reply@antinews.nushackers.org",
      :subject => "[Antinews] Mention from #{comment.user.username} on " <<
      "#{comment.story.title}")
  end
end
