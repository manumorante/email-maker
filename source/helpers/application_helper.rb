# encoding: utf-8

module ApplicationHelper

  default_font = "Arial"
  default_font_size = "12px"

  # Pinta el layout base (footer y header) mas el layout especifico
  def bp_mail layout, &block
    html = render :partial => "layouts/mailings/base_header"
    html += render :partial => "layouts/mailings/#{layout}", :locals => {:text => capture(&block).html_safe}
    html +=render :partial => "layouts/mailings/base_footer"

    html.html_safe
  end

  # Titular (en imagen de texto)
  def bp_mail_title src, alt
    html = <<-HTML
      <table cellpadding="0" cellspacing="0" border="0">
          <tr>
              <td width="568">
                #{image_tag("#{Vars::APP_URL}/emails-layouts/texts/#{I18n.locale.to_s}/#{src}.png", {:style => "display:block;", :alt => "#{alt}", :title => "#{alt}"})}
              </td>
          </tr>
      </table>
    HTML

    html.html_safe
  end
  
  def bp_mail_image options
    # src = !(options[:src] =~ /\//).blank? ? "#{Vars::APP_URL}/#{options[:src]}" : "#{Vars::APP_URL}/emails-layouts/#{options[:src]}"
    # src = "#{Vars::APP_URL}/#{options[:src]}"
    src = "#{options[:src]}"
    alt = options[:alt].blank? ? '' : options[:alt]
    width = options[:width].blank? ? '' : options[:width]
    height = options[:height].blank? ? '' : options[:height]

    image_tag(src, {:width=>width, :height=>height, :style => "display:block; border:none;", :alt => "#{alt}", :title => "#{alt}"} )
  end

  def bp_mail_multicountry_image options
    src = "#{Vars::APP_URL}/emails-layouts/#{I18n.locale.to_s}/#{options[:src]}"
    alt = options[:alt].blank? ? '' : options[:alt]

    image_tag(src, {:style => "display:block; border:none;", :alt => "#{alt}", :title => "#{alt}"})
  end

  def bp_mail_footer layout = "default"
    html = render :partial => "layouts/mailings/#{layout}_footer"
    html.html_safe
  end

  def bp_mail_table options="", &block
    if block_given?
      content = capture(&block)
    else
      content = options.blank? ? "" : options
    end

    width = options[:width].blank? ? '' : options[:width]

    html = <<-HTML
    <table cellpadding="0" cellspacing="0" border="0" width="#{width}" style="width:#{width}">
      <tr>
      <td>#{content.html_safe}</td>
      </tr>
    </table>
    HTML

    html.html_safe
  end

  def bp_mail_p text, size
    html = <<-HTML
    <p style="font-family:#{default_font};font-size:#{default_font_size}">#{capture(&block).html_safe}</p>
    HTML

    html.html_safe
  end

  def bp_mail_spacer options
    size = options[:size].blank? ? '20' : options[:size]
    bp_mail_image :src => "spacer-#{size}.png"
  end

  def bp_mail_spacer_table options
    size = options[:size].blank? ? '' : options[:size]
    width = options[:width].blank? ? '100%' : options[:width]

    bp_mail_table :width=>width do
      bp_mail_spacer :size=>size
    end
  end

end