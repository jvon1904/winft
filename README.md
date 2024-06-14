# Winft

Winft stands for Windows FILETIME or Windows NT FILETIME or Win32 FILETIME.

This is a miniscule gem with only one goal (currently): to extend the Ruby core Time class's methods with `at_winft`.  This is similar to the `Time::at` method which recieves as input an integer which is the number of seconds since the UNIX epoch (Jan. 1st, 1970).  The `at_winft` method is different in two ways: 1.) it can receive both an Integer or String, and 2.) it's argument must be the number of 100-nanosecond intervals since Jan. 1st 1601.

This can be useful when working with file timestamps that originated from a Windows system, for instance working with Microsoft Active Directory attributes.

Currently, this method only returns local time.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add winft

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install winft

## Usage

Retrieve the current timestamp from https://www.epochconverter.com/ldap and feed it to the method `Time::at_winft` (similar to `Time::at`).

The class method `at_winft` accepts both a String or Integer.

```ruby
Time.at_winft("133628444910000000")

# or

Time.at_winft(133628444910000000)

# => 2024-06-14 09:14:51 -0400
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Winft project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/winft/blob/main/CODE_OF_CONDUCT.md).
