# encoding: utf-8

module ApplicationHelper

  # Image
  def image(opts = {})
    if opts[:width].blank? || opts[:height].blank?
      error 'You need specify the "width" and "height" to the images.'

    else
      host = build? ? current_page.data.host : ''
      src = "#{host}/emails/#{current_page.data.folder}/images/#{opts[:src]}"
      w = opts[:width]
      h = opts[:height]
      alt = opts[:alt]

      "<div style='width:#{w};height:#{h}'><img src='#{src}' width='#{w}' height='#{h}' alt='#{alt}' title='#{alt}' style='display:block;border:none;'></div>"
    end
  end

  # Table
  def table(opts = {})
    width = opts[:width].blank? ? 'auto' : opts[:width]
    align = opts[:align].blank? ? 'center' : opts[:align]
    "cellpadding='0' cellspacing='0' border='0' width='#{width}' align='#{align}' #{opts[:attr]} style='width:#{width};align:#{align};#{opts[:style]}'"
  end

  # Font
  def font(opts = {})
    color  = opts[:color].blank? ? current_page.data.color1 : eval("current_page.data.color#{opts[:color]}")
    family = opts[:family].blank? ? current_page.data.font_family : opts[:family]
    size   = opts[:size].blank? ? current_page.data.font_size : opts[:size]

    "style='font-family:#{family};font-size:#{size};color:#{color}'"
  end

  # Spacer
  def spacer(opts = {})
    size = opts[:size].blank? ? '20' : opts[:size]
    image :src => "spacer-#{size}.png"
  end

  # Error
  def error msg
    "<p style='color: red'>#{msg}</p>"
  end

end