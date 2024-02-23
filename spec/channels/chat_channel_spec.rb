require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  let(:user) { create(:user) }
  let(:chat) { create(:chat) }
  let(:message) { create(:message) }
  before do
    stub_connection(user_id: user.id)
    subscribe(id: chat.id)
  end

  it "successfully subscribes to the channel" do
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("chat_#{chat.id}")
  end

  it "unsubscribes from the channel" do
    unsubscribe
    expect(subscription).to_not have_streams
  end

  describe "speak" do
    let(:data) { { 'user_id' => user.id, 'message' => 'Test message' } }

    it "creates a new message" do
      expect {perform(:speak, data)}.to change(Message, :count).by(1)
    end

    it "broadcasts the message to the channel" do
      expect {perform(:speak, data) }.to have_broadcasted_to("chat_#{chat.id}").with(message: 'Test message')
    end
  end
end
