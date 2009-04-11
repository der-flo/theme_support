# The controller for serving/cacheing theme content...
#
class ThemeController < ActionController::Base

  after_filter :cache_theme_files
  
  def stylesheets
    render_theme_item(:stylesheets, joined_filename, params[:theme], 'text/css')
  end

  def javascript
    render_theme_item(:javascript, joined_filename, params[:theme], 'text/javascript')
  end

  def images
    render_theme_item(:images, joined_filename, params[:theme])
  end

  def error
    send_404
  end
  
  private
  
  def render_theme_item(type, file, theme, mime = mime_for(file))

    send_404 and return if file.split(%r{[\\/]}).include?("..")
    begin
      send_file "#{Theme.path_to_theme(theme)}/#{type}/#{file}", :type => mime,
                :disposition => 'inline', :stream => false
    rescue ActionController::MissingFile
      send_404
    end
  end

  def cache_theme_files
    path = request.request_uri
    begin
      ThemeController.cache_page( response.body, path )
    rescue
      STERR.puts "Cache Exception: #{$!}"
    end
  end

    
  def mime_for(filename)
    case filename.downcase
    when /\.js$/
      'text/javascript'
    when /\.css$/
      'text/css'
    when /\.gif$/
      'image/gif'
    when /(\.jpg|\.jpeg)$/
      'image/jpeg'
    when /\.png$/
      'image/png'
    when /\.swf$/
      'application/x-shockwave-flash'
    else
      'application/binary'
    end
  end

  def send_404
    render :nothing => true, :status => 404
  end
  def joined_filename
    params[:filename].join '/'
  end

end
