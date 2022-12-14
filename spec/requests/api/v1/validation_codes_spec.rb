require 'rails_helper'

RSpec.describe "Api::V1::ValidationCodes", type: :request do
  #邮箱不能为空
  it "email can't be blank" do
    post "/api/v1/validation_codes", params: { email: "" }
    expect(response).to have_http_status(422)
  end
  # 可以发送验证码
  it "can send validation code" do
    post "/api/v1/validation_codes", params: { email: "vino0908@outlook.com" }
    expect(response).to have_http_status(201)
    expect(response.body).to include("验证码已发送")
  end
  # 60s内不能重复发送
  it "can't send validation code in 60s" do
    post "/api/v1/validation_codes", params: { email: "vino@qq.com" }
    expect(response).to have_http_status(201)
    expect(response.body).to include("验证码已发送")
    post "/api/v1/validation_codes", params: { email: "vino@qq.com" }
    expect(response).to have_http_status(429)
  end
end
