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
    code = 000;
    Net::HTTP.start(uri.host) do |http|
      f = File.open(self.path, File::RDWR|File::CREAT, 0644)
      f.binmode
      begin
        http.request_get(uri.path) do |resp|
          code = resp.code
          resp.read_body do |segment|
            f.binmode
            f.write(segment.to_blob)
          end
        end
      ensure
        f.close()
      end
    end
    return code
  end
end
