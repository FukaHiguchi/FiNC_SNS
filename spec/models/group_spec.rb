require 'rails_helper'

RSpec.describe Group, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    users = create_list(:user, 3)
    puts users
    @group = FactoryBot.build(:group, users: users)
  end

  context "group登録完了" do
    it "中身に問題がない" do
      @group.valid?
      expect(@group).to be_valid
    end
  end 
  
  context "group登録失敗" do
    it "nameが空の場合" do
      @group.name = nil
      @group.valid?
      expect(@group.errors.full_messages).to include("Nameを入力してください") 
    end
  end
end
