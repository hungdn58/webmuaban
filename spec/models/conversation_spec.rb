require  'spec_helper'

describe Comment do
	it "create conversation" do
		conversation = Conversation.new
		expect(conversation).to be_valid
	end

	it "save conversation" do
		conversation = Conversation.new
		conversation.should be_valid
	end

	it "create conversation with sender_id and recipient_id" do
		user1 = User.new
		user2 = User.new
		conversation = Conversation.new(sender_id: user1.id, recipient_id: user2.id)
		expect(conversation.sender_id).to eq user1.id
		expect(conversation.recipient_id).to eq user2.id
	end
end