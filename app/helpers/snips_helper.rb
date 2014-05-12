module SnipsHelper  
  def composer
    @snip = Snip.new
    @image = Image.new
    @video = Video.new
    @website = Website.new
  end
end