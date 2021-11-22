require 'sinatra'

VOLUME_REGEX = /.+Playback -?\d+ \[(?<volume>\d+)%\].+/

def OK(content)
  [
    200,
    { 'Content-Type' => 'text/plain' },
    content
  ]
end

get '/' do
  OK('Hello, World!')
end

get '/devices' do
  #
end

get '/devices/:device/volume' do
  result = %x{ amixer -M sget #{params['device']} }
  match = VOLUME_REGEX.match(result)
  OK(match[:volume])
end

post '/devices/:device/volume' do
  percentage = request.body.read
  result = %x{ amixer -M sset #{params['device']} #{percentage}% }
  match = VOLUME_REGEX.match(result)
  OK(match[:volume])
end
