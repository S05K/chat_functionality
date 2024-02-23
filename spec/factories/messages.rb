# spec/factories/messages.rb

FactoryBot.define do
  factory :message do
    content { "Test message" }
    user_id {1}
    chat_id {1}
  end
end
