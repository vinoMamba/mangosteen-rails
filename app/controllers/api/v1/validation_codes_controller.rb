class Api::V1::ValidationCodesController < ApplicationController
  def create
    # 生成6位随机数
    validation_code = ValidationCode.new email: params[:email], kind: "sign_in" 
    if validation_code.save
      render json: { message: "验证码已发送" }, status: 201
    else
      render json: { message: validation_code.errors }, status: 422
    end
  end
end