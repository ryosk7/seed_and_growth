module ApplicationHelper
  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
      def block_code(code, language)
          language = language.split(':')[0]

          case language.to_s
          when 'rb'
              lang = 'ruby'
          when 'yml'
              lang = 'yaml'
          when 'css'
              lang = 'css'
          when 'html'
              lang = 'html'
          when ''
              lang = 'md'
          else
              lang = language
          end

          CodeRay.scan(code, lang).div
      end
  end

  def markdown(text)
      html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
      options = {
          autolink: true,
          space_after_headers: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          tables: true,
          hard_wrap: true,
          xhtml: true,
          lax_html_blocks: true,
          strikethrough: true
      }
      markdown = Redcarpet::Markdown.new(html_render, options)
      markdown.render(text)
  end

  def default_meta_tags
    {
      title:       "Seed and Growth",
      description: "アイデアは成長する",
      keywords:    "Ruby,Meta,Tags",
      icon: image_url("https://res.cloudinary.com/dmzlfjx06/image/upload/v1513079672/icon_qjz9ww.png"), # favicon
      noindex: ! Rails.env.production?, # production環境以外はnoindex
      charset: "UTF-8",
      # OGPの設定
      og: {
        title: "Seed and Growth",
        type: "website",
        url: request.original_url,
        image: image_url("https://res.cloudinary.com/dmzlfjx06/image/upload/v1512998167/IMG_7007_hoataj.png"),
        site_name: "Seed and Growth",
        description: "アイデアは成長する",
        locale: "ja_JP"
      }
    }
  end

  def liked_user
    Post.find_by(id: params[:id]).likes.each do |like|
      User.where(id: like.user_id)
    end
  end
end
