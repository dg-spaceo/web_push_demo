class WebpushNotification < ApplicationRecord
  def send_notiy(msg)
    Webpush.payload_send(
      message: msg,
      endpoint: self.endpoint,
      p256dh: self.p256dh_key,
      auth: self.auth_key,
      vapid: {
        subject: "mailto:sender@example.com",
        public_key: Rails.application.credentials.dig(:webpush, :public_key),
        private_key: Rails.application.credentials.dig(:webpush, :private_key)
      }
    )
  end
end
