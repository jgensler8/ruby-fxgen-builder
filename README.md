# ruby-fxgen-builder

## Turn you Ruby code into a Google Cloud Function

1. First, you'll need to start with a file named `index.rb`.

```ruby
#!/usr/bin/env ruby
puts "hello world"
```

`Gemfile`

```
gem "hiera", "~> 3.4.2"
```

2. Run the packaging system as a Docker container

```
docker run -it -v $PWD:/workdir -v $PWD/output:/output hub.docker.com/jgensl2/ruby-fxgen-builder:v1.0.0
```

3. Upload your function to Google Cloud Functions

...

4. Profit!

## How to Send Data to Your Function

Data is sent to your code's standard input file.

The existing code in the `example` directory echos the headers and body that is sent to the function.

```
#!/usr/bin/env ruby

require 'json'

inp = $stdin.read

obj = JSON.parse(inp)

puts obj
```

From here, you could use `obj["body"]` or `obj["headers"]` to get useful information.
