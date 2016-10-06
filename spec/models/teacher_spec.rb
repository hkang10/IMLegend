require 'rails_helper'

describe Teacher do
  let(:teacher) { Teacher.create!(first_name: 'Bob', last_name: 'Hope', email: 'price@isright.com', password: 'winner', admin?: true)}
 
  describe "Has readable properties" do
    it "Has a readable first_name" do
      expect(teacher.first_name).to eq 'Bob'
    end

    it "Has a readable last_name" do
      expect(teacher.last_name).to eq 'Hope'
    end

    it 'Has a readable email' do
      expect(teacher.email).to eq 'price@isright.com'
    end

    it "has secure password" do 
      assert_respond_to teacher, :password_digest
      assert_respond_to teacher, :authenticate, "teacher requires has_secure_password"
    end

    it "has a password length less than or equal to 72 characters" do
      expect(teacher.password_digest.length).to be <= 72
    end   

    it 'is an admin' do
      expect(teacher.admin?).to eq true
    end
  end

end
