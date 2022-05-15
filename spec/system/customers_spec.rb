
require 'rails_helper'

def basic_path(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end


RSpec.describe "カスタマーログイン機能", type: :system do

  before do
    @customer = FactoryBot.create(:customer)
    sleep 0.1
  end
  
  it "ログインに成功し、トップページに遷移する" do
    basic_path root_path
    visit new_customer_session_path
    expect(current_path).to eq(new_customer_session_path)
    fill_in 'email', with: @customer.email
    fill_in 'password', with: @customer.password
    click_on('ログイン')
    expect(current_path).to eq(root_path)
  end

  it "ログインに失敗するとサインインページに戻る" do
    basic_path root_path
    visit new_customer_session_path
    expect(current_path).to eq(new_customer_session_path)
    fill_in 'email', with: 'test@test'
    fill_in 'password', with: 'test333'
    click_on('ログイン')
    expect(current_path).to eq(new_customer_session_path)
  end
end
