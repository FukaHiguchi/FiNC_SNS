require 'rails_helper'

RSpec.describe StepLog, type: :model do
  before do
    user = FactoryBot.build(:user)
    @step_log = FactoryBot.build(:step_log, user: user)
  end

  context "step_log登録完了" do
    it "内容に問題がない場合" do
      expect(@step_log).to be_valid
    end
  end

  context "step_log登録失敗" do
    it "Footstepが空では登録できない" do
      @step_log.footsteps = nil
      @step_log.valid?
      expect(@step_log.errors.full_messages).to include("Footstepsを入力してください")
    end

    it "日付がからでは登録できない" do
      @step_log.day = nil
      @step_log.valid?
      expect(@step_log.errors.full_messages).to include("Dayを入力してください")
    end
  end
  # let(:step_log){build(:step_log)}
  # it "is valid with a valid footsteps" do
  #   expect(step_log).to be_valid
  # end
  # it "is not valid without a footsteps" do
  #   step_log.footsteps = ''
  #   expect(step_log).to_not be_valid
  # end
  # it "is not valid with a footsteps longer than 10000000000" do
  #   step_log.footsteps = Faker::Number.between(from: 0, to: 10000000001)
  #   expect(step_log).to_not be_valid
  # end
  # pending "add some examples to (or delete) #{__FILE__}"
end
