class SerieMailer < ApplicationMailer
  def share_serie_mail(serie, user, friend_mail)
    @serie = serie
    @user = user
    mail subject: "#{user.full_name} shared a serie with you!", to: friend_mail
  end
end
