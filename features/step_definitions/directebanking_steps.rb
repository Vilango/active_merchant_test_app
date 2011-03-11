Given /^I am at directebanking page$/ do
  visit "http://localhost:8080/directebanking/"
  #click_button("Make payment")

  #puts "response: #{response.body}"
  
  # Schritt 1: Bitte wählen Sie Ihre Zahlungsmethode
  #response.should contain("Bitte aktivieren Sie JavaScript")
end
