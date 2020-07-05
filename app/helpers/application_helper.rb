module ApplicationHelper
  def header_bar
    cntnt = "<img src='https://raw.githubusercontent.com/Stricks1/cap-twitter/feature/app/assets/images/clapperboardWhite.png'"
    cntnt.concat("class='logo'><div class='align-self-center px-2 d-flex justify-content-between'>")
    if current_user
      cntnt.concat(logged_btn)
    else
      cntnt.concat(to_log_btn)
    end
    cntnt.concat('</div>')
    cntnt.html_safe
  end

  def to_log_btn
    ret = ''
    ret.concat((link_to 'Sign Up', signup_path, class: 'color-grey align-self-center px-2 flex-nowrap'))
    ret.concat(' ')
    ret.concat((link_to 'Login', login_path, class: 'color-grey align-self-center px-2 flex-nowrap'))
  end

  def logged_btn
    ret = ''
    ret.concat((link_to image_tag('https://raw.githubusercontent.com/Stricks1/cap-twitter/b3ee28c00f9504f9995a544ad14f2440b83f40a0/app/assets/images/pencil.svg', border: 0, class: 'logo-sm', alt: 'edit'), edit_user_path(current_user)))
    ret.concat(' ')
    ret.concat((link_to image_tag('https://raw.githubusercontent.com/Stricks1/cap-twitter/23f63c21dad717cb072411ac3a3c1c338891995a/app/assets/images/mail.svg', border: 0, class: 'logo-sm', alt: 'email')))
    ret.concat(' ')
    ret.concat((link_to image_tag('https://raw.githubusercontent.com/Stricks1/cap-twitter/23f63c21dad717cb072411ac3a3c1c338891995a/app/assets/images/search.svg', border: 0, class: 'logo-sm', alt: 'search')))
    ret.concat(' ')
    ret.concat((link_to 'Logout', logout_path, class: 'color-grey align-self-center px-2 flex-nowrap'))
  end

  def flash_info
    if notice
      ret = "<div><span id='notice' class='text-center d-block py-2'>"
      ret.concat(notice + '</span></div>')
      ret.html_safe
    elsif alert
      ret = "<div><span id='alert' class='text-center d-block py-2'>"
      ret.concat(alert + '</span></div>')
      ret.html_safe
    end
  end

  def current_profile(usr)
    usr = set_user_images(usr)
    begin
      image_tag(usr.photo, border: 0, class: 'profile p-2', alt: usr.username)      
    rescue      
      image_tag('https://raw.githubusercontent.com/Stricks1/cap-twitter/feature/app/assets/images/user_default.png', border: 0, class: 'profile p-2', alt: usr.username)      
    end
  end

  def set_user_images(usr)
    usr.photo = 'https://raw.githubusercontent.com/Stricks1/cap-twitter/feature/app/assets/images/user_default.png' if usr.photo.blank?
    usr.cover_image = 'https://raw.githubusercontent.com/Stricks1/cap-twitter/feature/app/assets/images/cover_default.jpg' if usr.cover_image.blank?
    return usr
  end
end
