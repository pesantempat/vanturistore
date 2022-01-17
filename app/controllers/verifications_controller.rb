class VerificationsController < ApplicationController
    def create
        current_customer.verification_code =  1_000_00 + rand(10_000_00 - 1_000_00)
        #current_customer.phone_customer = current_customer.phone_customer
        current_customer.save
      
        to = current_customer.phone_customer
        #if to[0] = "0"
          #to.sub!("0", '+44')
        #end
      
        #@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
        #@twilio_client.account.sms.messages.create(
          #:from => ENV['TWILIO_PHONE_NUMBER'],
          #:to => to,
          #:body => "Your verification code is #{current_customer.verification_code}."
        #)
        redirect_to edit_customer_registration_path, :notice => 'A verification code has been sent to your mobile. Please fill it in below.' 
        return
    end

    def verify
        if current_customer.verification_code == params[:verification_code]
        current_customer.is_verified = true
        current_customer.verification_code = ''
        current_customer.save
        redirect_to homecustomer_path, :notice => 'Thank you for verifying your mobile number.'
        return
      else
        redirect_to edit_customer_registration_path, :notice => 'Invalid verification code.'
        return
      end
  end
end
