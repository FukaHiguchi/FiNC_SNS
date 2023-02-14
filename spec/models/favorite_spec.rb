require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    user = FactoryBot.create(:user)
    step_log = FactoryBot.create(:step_log)
    @like = FactoryBot.build(:favorite, user_id: user.id, step_log_id: step_log.id)
  end

  describe "正常値と異常値の確認" do
    context "likeモデルのバリデーション" do
      it "中身に問題がない" do
        expect(@like).to  be_valid
      end 

      it "user_idがなければ無効な状態であること" do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end

      it "step_log_idがなければ無効な状態であること" do
        @like.step_log_id = nil 
        @like.valid?
        expect(@like.errors.full_messages).to include("Step logを入力してください")
      end
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
