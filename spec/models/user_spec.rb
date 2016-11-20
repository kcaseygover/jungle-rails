require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "email has to be unique" do
      @user1 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
      @user2 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
      expect(@user1).to be_valid
      expect(@user2.id).to be nil

    end

    it "password and password_confirmation must be present" do
      @user1 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
      @user2 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password')
      expect(@user1).to be_valid
      expect(@user2.id).to be nil
    end

    it "password and password_confirmation must match" do
      @user1 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
      @user2 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'drowssap')
      expect(@user1).to be_valid
      expect(@user2.id).to be nil
    end

    it "should validate_length_of(:password).is_at_least(8)" do
      @user1 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
      @user2 = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'p', password_confirmation:'p')
      expect(@user1).to be_valid
      expect(@user2.id).to be nil
    end
  end


  describe '.authenticate_with_credentials' do
    it "should login if email and password combination match existing" do
       @user = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
       expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_present
    end
    it "should reject login if email and password combination do not match existing" do
       @user = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
       expect(User.authenticate_with_credentials("user@email.com", "user.password")).to be nil
    end
    it "should find users if white spaces around email" do
       @user = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
       expect(User.authenticate_with_credentials("   #{@user.email}",@user.password)).to be_present
     end
     it "should find users if capitals in email" do
       @user = User.create(first_name: 'Karen', last_name: 'Gover', email:'dw@test.com', password:'password', password_confirmation:'password')
       expect(User.authenticate_with_credentials('Dw@TeSt.com',@user.password)).to be_present
     end
  end
end
