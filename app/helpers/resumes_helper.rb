module ResumesHelper
  
  def new_resume
    @resume = Resume.new
    @employment = Employment.new
  end
  
end