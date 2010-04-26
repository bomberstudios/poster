require 'rubygems'
require "#{ENV['HOME']}/.gems/gems/sinatra-1.0/lib/sinatra"

def url
  local = env["rack.url_scheme"] + "://" + env["HTTP_HOST"]
end

def is_image f
  f.include?('.png') || f.include?('.jpg') || f.include?('.gif')
end

def now
  Time.now.strftime('%Y%m%d%H%M%S')
end

def filetype f
  case f
  when 'image/png', 'application/octet-stream'
    return 'png'
  when 'image/jpg'
    return 'jpg'
  end
end

get '/' do
  erb :home
end

post '/' do
  f = params[:file]
  filename = params[:pageName] ? params[:pageName] + "." + filetype(f[:type]) : f[:filename]
  filename = now + "-" + filename
  filename.gsub!(' ','_')
  
  if is_image(f[:filename])
    File.open("#{Dir.pwd}/public/#{filename}","w") do |t|
      t << f[:tempfile].read
    end
    "#{url}/#{filename}"
  else
    status 403
    "You can only upload images!"
  end
end
