puts "ActiveMerchant initializer"

# The following require is used to override the Adyen constants with the real values for testing 

if RAILS_ENV == 'production'
else
  ActiveMerchant::Billing::Base.mode = :test
end


# Needed for payment_service_for to work
ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)


# # adyen_payment_page = "pay" # choose from: pay, select #
# adyen_payment_page = "select" # choose from: pay, select
# #adyen_payment_page = "tokenonepage"
# #adyen_payment_page = "tokenselect"
# 
# ActiveMerchant::Billing::Integrations::Adyen.production_url = "https://live.adyen.com/hpp/#{adyen_payment_page}.shtml"
# ActiveMerchant::Billing::Integrations::Adyen.test_url = "https://test.adyen.com/hpp/#{adyen_payment_page}.shtml"
# 
module ActiveMerchant
  module Billing
    module Integrations #:nodoc:
      module Direktebanking
        class Helper < ActiveMerchant::Billing::Integrations::Helper

          def form_fields_with_logging
#            puts "pre: #{@fields.to_yaml}"
            result = form_fields_without_logging
            puts "post: #{@fields.to_yaml}"
            result
          end

          alias_method_chain :form_fields, :logging
        end
      end
      
    end
  end
end
