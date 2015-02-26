require 'spec_helper'

describe User do
  def create_user
    User.create(name: 'Vasya Pupkin',
                username: 'glitch',
                email: 'test@test.com',
                password: 'helloworld',
                password_confirmation: 'helloworld')
  end

  def user_short_password
    User.create(name: 'Vasya Pupkin',
                username: 'glitch',
                email: 'test@test.com',
                password: 'hello',
                password_confirmation: 'hello')
  end

  def user_long_password
    User.create(name: 'Vasya Pupkin',
                username: 'glitch',
                email: 'test@test.com',
                password: ('hello' * 7),
                password_confirmation: ('hello' * 7))
  end

  def user_no_password_confrmation
    User.create(name: 'Vasya Pupkin',
                username: 'glitch',
                email: 'test@test.com',
                password: 'helloworld')
  end

  def user_wrong_password_confrmation
    User.create(name: 'Vasya Pupkin',
                username: 'glitch',
                email: 'test@test.com',
                password: 'helloworld',
                password_confirmation: 'world')
 end

  def user_repeatable_email
    User.create(name: 'Darth Weider',
                username: 'darklord',
                email: 'test@test.com',
                password: 'testtest',
                password_confirmation: 'testtest')
  end

  def user_repeatable_username
    User.create(name: 'Darth Weider',
                username: 'glitch',
                email: 'darthweider@gmail.com',
                password: 'testtest',
                password_confirmation: 'testtest')
  end

  context 'can be created and retrieved from DB if has correct data' do
    it 'created' do
      expect(User.count).to eq 0
      create_user
      expect(User.count).to eq 1
    end

    it 'retrieved from db' do
      create_user
      user = User.first
      expect(user.email).to eq 'test@test.com'
      expect(user.username).to eq 'glitch'
    end
  end

  context 'can not be created if has wrong data' do
    it 'password has less than 8 characters' do
      user_short_password
      expect(User.count).to eq 0
    end

    it 'password has more than 32 characters' do
      user_long_password
      expect(User.count).to eq 0
    end

    it 'has no password confirmation' do
      user_no_password_confrmation
      expect(User.count).to eq 0
    end

    it 'has wrong password confirmation' do
      user_wrong_password_confrmation
      expect(User.count).to eq 0
    end

    it 'has same address as one of the users' do
      create_user
      user_repeatable_email
      expect(User.count).to eq 1
    end

    it 'has same username as one of the users' do
      create_user
      user_repeatable_username
      expect(User.count).to eq 1
    end
  end

  context 'can be retrieved with passing correct data' do
    it 'passing correct password and email' do
      create_user
      user = User.authenticate('test@test.com', 'helloworld')
      expect(user).not_to be nil
    end
  end
end
