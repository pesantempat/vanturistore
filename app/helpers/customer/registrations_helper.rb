module Customer::RegistrationsHelper
    def mobile_verification_button
        return '' unless current_customer.needs_phone_customer_verifying?
        html = <<-HTML
          #{form_tag(verifications_path, method: "post")}
          #{button_tag('Kirim Kode OTP', type: "submit", :class =>"submit-btn")}
          </form>
        HTML
        html.html_safe
    end

    def verify_mobile_number_form
        return '' if current_customer.verification_code.blank?
        p current_customer.verification_code.empty?
        html = <<-HTML
          <center><u><h3>Enter Verification Code</h3></u></center>
          #{form_tag(verifications_path, method: "patch")}
          #{text_field_tag('verification_code', "", :class =>"form-control", :autofocus => true)}<br><br>
          #{button_tag('Submit Code', type: "submit", :class =>"submit-btn", :style =>"background-color:#fff; color:#07a99c; border-style:solid")}
          </form>
        HTML
        html.html_safe
      end
end
