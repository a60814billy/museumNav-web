class Api::TicketController < ApplicationController

  def auth

    code = params[:code]

    findAll = Activity.where(["ticket_auth_code = ?", code])

    if findAll.length === 0
      findTicket = Ticket.where(["ticket_authentication_code = ?" , code])
    end

    if findAll.length > 0
      render :json => findAll[0].id
      return
    end

    if findTicket.length > 0
      render :json => findTicket[0].activity_id
      return
    end

    render :text => ""

  end

end
