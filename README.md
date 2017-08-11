# AndSqr

## What is this?

```Hash#andsqr``` and ```Array#andsqr``` let us write:

``` @phone = json.andsqr ['user', 'phone']```

which is the same as writing:

```
@phone = nil
@phone = json['user']['phone'] unless json['user'].nil? || json['user']['phone'].nil?
```

This allows us to to gain *safe navigation* when parsing through nested arrays and hashes.

## Installing

Install via RubyGems

```gem install andsqr```

or add to your gemfile:

```gem "andsqr"```

## Usage

I frequently find myself or someone I know having to navigate through a large set of arrays and hashes. This frequently comes up when gathering data from within a json datastructure. Each line of code needs to both get to the data we're looking for, and fail without throwing an error. That's where AndSqr comes in.  It gives some of the functionality of [andand](https://github.com/raganwald/andand) for things you get via square brackets.

Lets take a simple example of a hash with one value that has a set of nested arrays:

```
{ 
  :happy => [
              [ 
                [1,2], 
                [3,4] 
              ], 
              [ 
                2 
              ] 
            ] 
}
```

```
 > require 'andsqr'
=> true
 > a = {:happy => [ [ [1,2], [3,4] ], [2] ] }
```

We can access any depth by using a.andsqr and passing it an array of values you want to navigate through:

```
 > a.andsqr [:happy,0,0,0]
=> 1
 > a.andsqr [:happy,0,0]
=> [1,2]
 > a.andsqr [:happy,0,1]
=> [3,4]
```

We can also try and access values that are unreachable, and we'll have ```nil``` returned, rather than throwing an error:

```
 > a.andsqr [:sad]            # This key isn't in the hash.
=> nil
 > a.andsqr [:happy,1,0,0]    # This array doesn't exist in :happy.
=> nil
 > a.andsqr [:happy,0,0,0,0,0,0,0] # No array is this long in our JSON file.
=> nil

## License

This code is free to use under the terms of the [MIT license](http://en.wikipedia.org/wiki/MIT_License).

## Contact

I'd love to hear from you. Send me an [email](mailto:andsqr@cjkinni.com) or [tweet](http://twitter.com/cjkinni).
