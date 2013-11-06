Given /^a greeter$/ do
	@greeter = CucumberGreeter.new
end

When /^I send it the greet message$/ do
	@message = @greter.greet
end

Then /^I should see "([^"]*)"$/ do |greeting|
	@message.should == greeting
end

