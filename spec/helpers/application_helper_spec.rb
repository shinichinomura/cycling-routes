require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#normalize_og_image" do
    before do
      # allow(helper).to receive(:current_user).and_return(account)
    end

    subject { helper.normalize_og_image(path) }

    context "ローカルファイルの場合" do
      let(:path) { '/hoge.jpg' }

      it { is_expected.to eq 'http://test.host/hoge.jpg' }
    end

    context "S3に保存されたファイルの場合" do
      let(:path) { '//example.com/hoge.jpg' }

      it { is_expected.to eq 'http://example.com/hoge.jpg' }
    end
  end
end
