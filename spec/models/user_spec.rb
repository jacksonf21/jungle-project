require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.create(
      name: 'test', email: 'test2@test.com', password: 'test123'
    )
  }

  describe 'Validations' do
    it 'passes all data attributes' do
      expect(subject).to be_valid
    end

    it 'signup: require password field' do 
      subject.password = nil
      expect(subject).to_not be_valid
    end
    
    it 'same password' do
      subject.password_confirmation = 'det'
      expect(subject).to_not be_valid
    end

    it 'signup: require unique email' do
      fail_user = User.create(
        name: 'test', email: 'test2@test.com', password: 'test123', password_confirmation: 'test123'
      )
      expect(subject).to_not be_valid
    end

    it 'signup: password_short' do
      subject.password = 't'
      expect(subject).to_not be_valid
    end

    it 'email' do 
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'name' do 
      subject.name = nil
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'auth' do
      @new = User.create(
        name: 'test', email: 'ab@hotmail.com', password: 'superhotfire'
      )
      @res = User.authenticate_with_credentials('ab@hotmail.com', 'superhotfire')
      expect(@res).to_not be_eql(nil)
    end
    
    it 'leniency for sanitize' do
      @new = User.create(
        name: 'test', email: 'ab@hotmail.com', password: 'superhotfire'
      )
      @res = User.authenticate_with_credentials('    ab@hotmail.com', 'superhotfire')
      expect(@res).to_not be_eql(nil)
    end

    it 'leniency for sanitize' do
      @new = User.create(
        name: 'test', email: 'ab@hotmail.com', password: 'superhotfire'
      )
      @res = User.authenticate_with_credentials('Ab@hotmail.com', 'superhotfire')
      expect(@res).to_not be_eql(nil)
    end
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
