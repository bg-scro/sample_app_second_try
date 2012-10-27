include ApplicationHelper

def valid_signin(user)
	fill_in "Email", 		with: user.email 
	fill_in "Password",	with: user.password 
	click_button "Sign in"
end

# Custom matcher definition - see pp 370 of Rails Tutorial (Sxn 8.3)
RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

# Custom matchers developed in the 8.5 exercises
RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end

RSpec::Matchers.define :have_title do |message|
	match do |page|
		page.should have_selector('title', text: message)
	end
end

RSpec::Matchers.define :have_heading do |message|
	match do |page|
		page.should have_selector('h1', text: message)
	end
end

def full_title(page_title)
	base_title = "Ruby on Rails Tutorial Sample App"
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}"
	end
end