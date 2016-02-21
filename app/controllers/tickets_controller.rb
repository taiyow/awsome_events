# -*- coding: utf-8 -*-
class TicketsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError, 'ログイン状態で TicketsController#new にアクセス'
  end

  def create
    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
      t.comment = params[:ticket][:comment]
    end
    begin
      if ticket.save
        flash[:notice] = 'このイベントに参加表明しました'
        head 201
#      else
#        binding.pry
#        render json: { messages: ticket.errors.full_messages }, status: 422
      end
    rescue => e
      # render json: { messages: ticket.errors.full_messages }, status: 422
      render json: { messages: [e.message] }, status: 422
    end
  end
end
