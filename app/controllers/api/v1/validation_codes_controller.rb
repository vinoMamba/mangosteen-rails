class Api::V1::ValidationCodesController < ApplicationController
  def create
    validation_code = ValidationCode.new email: params[:email], kind: "sign_up"
    if validation_code.save
      render json: { message: "验证码已发送" }, status: 201
    else
      render json: { message: validation_code.errors }, status: 422
    end
  end
end
