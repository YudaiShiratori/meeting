class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    
    mail to: "koporinyo@eay.jp",subject: "写真投稿完了メール"
  end
end