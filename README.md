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
docker run -it -e PACKAGE -e FUNCTION -v $PWD:/workdir -v $PWD/output:/output hub.docker.com/jgensl2/ruby-node-package-builder
```

3. Upload your function to Google Cloud Functions

...

4. Profit!
