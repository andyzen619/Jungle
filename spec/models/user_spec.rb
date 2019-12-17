require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    before do 
      @correctUser = User.new
      @correctUser.name = "TestUser"
      @correctUser.email = "test@mail.com"
      @correctUser.password = 'test123'
      @correctUser.password_confirmation = 'test123'

      # @incorrectUser = User.new
      # @correctUser.name = "TestUse1"
      # @correctUser.email = "test@mail.com"
      # @correctUser.password = "test123"
      # @correctUser.password_confirmation = "test1234"
    end

    it 'Should have no error messages when passwords are correct' do
      @correctUser.valid?
      error = @correctUser.errors.full_messages

      expect(error).to be_empty
    end

    it 'Should give error message if passwords are mismatch' do
      @correctUser.password = '123'
      @correctUser.password_confirmation = '1234'

      @correctUser.valid?
      error = @correctUser.errors.full_messages

      expect(error).to include("Password confirmation doesn't match Password")
    end

    it 'Should return error if email, first name , or last name is left empty' do
      @correctUser.name = nil
      @correctUser.email = nil

      @correctUser.valid?
      error = @correctUser.errors.full_messages

      expect(error).to include("Name can't be blank", "Email can't be blank")
    end

    it 'Should return error when email is case sensitive' do
      @testuser2 = User.create(
        name: "TestUser2",
        email: "test@mail.com",
        password: "123456",
        password_confirmation: "123456"
      );

      @testuser3 = User.create(
        name: "TestUser3",
        email: "test@mail.com",
        password: "12345",
        password_confirmation: "12345"
      );

      @testuser3.valid?
      error = @testuser3.errors.full_messages
      p error

      expect(error).to include("Email has already been taken")
    end

    it 'Should return error when password is less than length of five.' do
      @correctUser.password = "123"
      @correctUser.password_confirmation = "123"

      @correctUser.valid?

      error = @correctUser.errors.full_messages
      p error

      expect(error).to include('Password is too short (minimum is 5 characters)')
    end
  end
end
