class LoyaltyPointTransactionMailer < ApplicationMailer

	default from: "VanturiStore <confirmation@bisniscepat.com>"

  def get_point (loyalty_point, loyalty_point_transaction)
    #@loyalty_point_transaction = loyalty_point_transaction
    @loyalty_point = loyalty_point
    @customer = @loyalty_point.customer
    @loyalty_point_transaction = loyalty_point_transaction
    @loyalty_point = @loyalty_point_transaction.loyalty_point
    #@t_mitra = loyalty_point_transaction
    #@customer = @loyalty_point.customer
    #@customer = @t_mitra.customer

    mail to: @loyalty_point.customer.email,
    	 #cc: @t_reservasi.email_pemesan,
    	 subject: "Point VanturiStore"
  end

  def redeemed_point (loyalty_point, loyalty_point_transaction)
    #@loyalty_point_transaction = loyalty_point_transaction
    @loyalty_point = loyalty_point
    @customer = @loyalty_point.customer
    @loyalty_point_transaction = loyalty_point_transaction
    @loyalty_point = @loyalty_point_transaction.loyalty_point
    #@t_mitra = loyalty_point_transaction
    #@customer = @loyalty_point.customer
    #@customer = @t_mitra.customer

    mail to: @loyalty_point.customer.email,
    	 #cc: @t_reservasi.email_pemesan,
    	 subject: "Redeemed Point VanturiStore"
  end
end
