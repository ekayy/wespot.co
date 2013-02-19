module ApplicationHelper
  def show_user_bg
    "background:transparent url(#{@place.coverphoto.url}) no-repeat fixed left top;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;"
  end
end
