require  'spec_helper'

describe Comment do
	it "create message" do 
		conversation = Conversation.new
		user = User.new
   		message = Message.new(body: "alo", conversation_id: 1, user_id: 1)
   		message.should be_valid
   end

	it "is invalid without a body" do 
   		message = Message.new(body: nil)
     	message.valid?
     	expect(message.errors[:body]).to include("can't be blank")
   end

   it "is invalid without a conversation" do 
   		message = Message.new(conversation_id: nil)
     	message.valid?
     	expect(message.errors[:conversation_id]).to include("can't be blank")
   end

   it "is invalid without a user" do 
   		message = Message.new(user_id: nil)
     	message.valid?
     	expect(message.errors[:user_id]).to include("can't be blank")
   end
end
