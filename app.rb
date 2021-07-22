require 'sinatra'
require 'json'
#Sinatra Doc: https://github.com/sinatra/sinatra#conditions

set :bind, "0.0.0.0"
port = ENV["PORT"] || "8080"
set :port, port
set :server_settings, :timeout => 60

# redirect with 302 returned.
get '/' do
  "
    <h1>Test</h1>

    <ul>
      <li><a id=\"link1\" href=\"#\">Link 2</a></li>
      <li><a id=\"link2\" href=\"#\">Link 31</a></li>
      <li><a id=\"link3\" href=\"#\">Link 45</a></li>
      <li><a id=\"link4\" href=\"#\">Link 61</a></li>
      <li><a id=\"link5\" href=\"#\">Link 91</a></li>
      <li><a id=\"link6\" href=\"#\">Link 121</a></li>
    <ul>

    <script>
      const element = document.getElementById(\"link1\")
      element.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/2`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }

      const element2 = document.getElementById(\"link2\")
      element2.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/31`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }

      const element3 = document.getElementById(\"link3\")
      element3.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/45`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }

      const element4 = document.getElementById(\"link4\")
      element4.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/61`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }

      const element5 = document.getElementById(\"link5\")
      element5.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/91`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }

      const element6 = document.getElementById(\"link6\")
      element6.onclick = (ev) => {
        ev.preventDefault()
        fetch(`/pages/121`)
        .then((res) => {
          res.json().then((jsonData) => {
            console.log(jsonData)
          })
        })
      }
    </script>
  "
end

# Read the files list from the GCS and echo out as json string
# name of file object is normally separted out two consecutive digits
# of the hex digest
get '/pages/:seconds' do
  seconds = (params["seconds"] && params["seconds"] != "") ? params["seconds"] : "45"
  puts "Seconds: #{seconds}."
  sleep seconds.to_i

  content_type :json

  {
    "response": "everything went fine"
  }.to_json
end
