# encoding: utf-8

module ApplicationHelper

  # IMAGE
  def image(options = {})
    # src = !(options[:src] =~ /\//).blank? ? "#{Vars::APP_URL}/#{options[:src]}" : "#{Vars::APP_URL}/emails-layouts/#{options[:src]}"
    # src = "#{Vars::APP_URL}/#{options[:src]}"
    src     = "#{options[:src]}"
    alt     = options[:alt].blank? ? '' : options[:alt]
    width   = options[:width].blank? ? '' : options[:width]
    height  = options[:height].blank? ? '' : options[:height]

    image_tag(src, {
      :width  => width,
      :height => height,
      :style  => 'display:block; border:none;',
      :alt    => "#{alt}",
      :title  => "#{alt}"}
    )
  end

  # TABLE
  def table(options = {})
    width = options[:width].blank? ? 'auto' : options[:width]
    "cellpadding='0' cellspacing='0' border='0' width='#{width}' style='width:#{width}'"
  end

  # FONT
  def font(options = {})
    family = options[:family].blank? ? Vars::DEFAULT_FONT_FAMILY : options[:family]
    size = options[:size].blank? ? Vars::DEFAULT_FONT_SIZE : options[:size]

    "style='font-family:#{family};font-size:#{size}'"
  end

  # SPACER
  def spacer(options = {})
    size = options[:size].blank? ? '20' : options[:size]
    image :src => "spacer-#{size}.png"
  end

end