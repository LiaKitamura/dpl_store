module ApplicationHelper

  def show_notice_message
    # return flash[:notice] if flash[:notice].present?
    # return flash[:alert] if flash[:alert].present?

    # the above is rewritten like so :

    # [:array_of_symbols, :array_of_symbols].each do |some_variable|
      # return flash[some_variable] if flash[some_variable].present?
    unless flash.empty?
      [:notice, :alert].each do |key|
        return content_tag(:div, flash[key], class: "flash-#{key}") if flash[key].present?
        end
      end
    end
  end
