require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe "#short_description" do
    context "紹介文が充分長い場合" do
      it do
        destination = create(:destination)

        expect(destination.short_description).to eq "ヤビツ峠は丹沢山地内で数少ない南北をつなぐ車道の峠で、他には犬越路（犬越路隧道）がある。しかし、犬越路南側の犬越路林道と北側の神之川林道は一般車両通行禁止のため、ヤビツ峠は丹沢山地唯一の南北をつなぐ一般車両通行可能な峠である。"
      end
    end

    context "規定の文字数以降に「。」がない場合" do
      it do
        destination = create(:destination, description: "ヤビツ峠は丹沢山地内で数少ない南北をつなぐ車道の峠で、他には犬越路（犬越路隧道）がある。しかし、犬越路南側の犬越路林道と北側の神之川林道は一般車両通行禁止のため、ヤビツ峠は丹沢山地唯一の南北をつなぐ一般車両通行可能な峠である")

        expect(destination.short_description).to eq "ヤビツ峠は丹沢山地内で数少ない南北をつなぐ車道の峠で、他には犬越路（犬越路隧道）がある。しかし、犬越路南側の犬越路林道と北側の神之川林道は一般車両通行禁止のため、ヤビツ峠は丹沢山地唯一の南北をつなぐ一般..."
      end
    end

    context "紹介文が短い場合" do
      it do
        destination = create(:destination, description: "短い紹介文です。")

        expect(destination.short_description).to eq "短い紹介文です。"
      end
    end
  end
end
