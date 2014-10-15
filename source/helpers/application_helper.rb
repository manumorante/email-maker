# encoding: utf-8

module ApplicationHelper

  # IMAGE
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

  # TABLE
  def table(opts = {})
    width = opts[:width].blank? ? 'auto' : opts[:width]
    align = opts[:align].blank? ? 'center' : opts[:align]
    "cellpadding='0' cellspacing='0' border='0' width='#{width}' align='#{align}' #{opts[:attr]} style='width:#{width};align:#{align};#{opts[:style]}'"
  end

  # FONT
  def font(opts = {})
    family = opts[:family].blank? ? current_page.data.font_family : opts[:family]
    size = opts[:size].blank? ? current_page.data.font_size : opts[:size]

    "style='font-family:#{family};font-size:#{size}'"
  end

  # SPACER
  def spacer(opts = {})
    size = opts[:size].blank? ? '20' : opts[:size]
    image :src => "spacer-#{size}.png"
  end

  # Error
  def error msg
    "<p style='color: red'>#{msg}</p>"
  end

end