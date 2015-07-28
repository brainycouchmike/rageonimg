class Image < ActiveRecord::Base
  self.primary_key = "id"
  
  def self.fetch_all (products)
    # Move content from #fetch action in controller to here
  end
  
  def download
    uri  = URI.parse(self.src)
    dir  = File.dirname(self.path)
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
    Net::HTTP.start(uri.host) do |http|
      f = File.open(self.path, File::WRONLY|File::CREAT)
      begin
        http.request_get(uri.path) do |resp|
          resp.read_body do |segment|
            f.binmode
            f.write(segment.to_blob)
          end
        end
      ensure
        f.close()
      end
    end
  end
end
