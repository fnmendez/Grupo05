class ChapterMailer < ApplicationMailer
  def share_chapter_mail(chapter, user, friend_mail)
    @chapter = chapter
    @user = user
    mail subject: "#{user.full_name} shared a chapter with you!", to: friend_mail
  end
end
