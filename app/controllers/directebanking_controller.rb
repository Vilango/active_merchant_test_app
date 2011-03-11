class DirectebankingController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  
  protect_from_forgery :except => :hook
  
  
  def index
    cur_order_id = "ORDER-ID-#{Time.new.to_i.to_s}"
    
    @data = {
      :user_id => DIRECTEBANKING_USER_ID,
      :project_id => DIRECTEBANKING_PROJECT_ID,
      :reason_1 => "R1 #{cur_order_id}",
      :reason_2 => "R2 #{cur_order_id}",
      :price => "EUR 50".to_money, 
      :order_id => cur_order_id,
      :user_variable_0 => DIRECTEBANKING_RETURN_URL,
#      :shopper_email => "gerwin.brunner@gmail.com",
      :project_password => DIRECTEBANKING_PROJECT_PASSWORD,
    }
    
  end
  
  def return
    @return = Directebanking::Return.new(request.query_string)
    ### check if retrun from server is valid...
    @return
  end


  
  def hook 
    puts "request.raw_post: #{request.raw_post}"
    notify = Directebanking::Notification.new(request.raw_post, :notification_password => DIRECTEBANKING_NOTIFICATION_PASSWORD)
    # save notification # state unprocessed
    status = 501
  
    if notify.acknowledge # does nothing
      # process
      
      puts "notify: #{notify.amount} #{notify.currency}"
      
      
      # notify.xxxx
      # change state to done!
      status = 200
    else
      logger.error("Failed to verify Directebanking's notification, please investigate")
      status = 406
    end
     
    render :nothing => true, :status => status
  end
  
end
