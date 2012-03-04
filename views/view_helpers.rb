#
# Methods placed in this module can be used inside of any view.
# View helpers allow you to encapsalate complex logic and keep your
# views pristine.
#
module ViewHelpers

  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      "\#{start_year}"
    else
      "\#{start_year}&#8211;\#{end_year}"
    end
  end

  # Handy for hiding a block of unfinished code
  def hidden(&block)
    #no-op
  end

  # Add your own helpers below...
  def fb_like_button
    options = {
      'class'             => 'fb-like',
      'data-href'         => "http://roots-hairstyles.nl/",
      'data-layout'       => "button_count",
      'data-send'         => false,
      'data-show-faces'   => false,
      'data-width'        => 450
    }
    content_tag :div, '', options
  end

  def roots_images
    path = '/images/fotos'
    list_files(path)
  end

 def roots_products
    path = '/images/products'
    list_files(path)
  end

 private
  def list_files(path)
    basedir = File.join(File.dirname(__FILE__),'../public', path)
    Dir[File.join(basedir, '*')].map do |file|
      File.join(path, File.basename(file))
    end
  end

end
