def full_title(page_title)
    base_title = "Social Service Platform"
    if page_title.empty?
        base_title
    else
        "#{base_title} | #{page_title}"
    end
end


def sign_in(user)
    visit signin_path
    fill_in "Email", with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
    #not working while not using capybara
    cookies[:remember_token] = user.remember_token
end
