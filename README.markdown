# SimpleGem

## Description

Creating RubyGems is fun work, but dealing with the complexity of hoe / bones / newgem is not (for me, at least).  SimpleGem is a way to quickly create a gem structure with the bare minimum needed to build and deploy. 

## Installation

Ideally:

    sudo gem install reagent-simple-gem --source=http://gems.github.com
    
But GitHub doesn't seem to consistently build gems, so use this as a fallback:

    $ git clone git://github.com/reagent/simple-gem.git
    $ cd simple-gem
    $ rake gem
    $ sudo gem install pkg/simple-gem-x.x.x.gem
    
## Usage

    $ simple-gem my-gem
    
This will create a gem structure under the 'my-gem' directory.  The command is pretty forgiving with the name you supply, it will automatically transform anything that is camelcased into something more ruby-like.

After generating your gem, go ahead and add information about your gem to both the `Rakefile` and `README.markdown` files.  The default version number is "0.1.0", but if you want to change that, take a look at `lib/my_gem/version.rb` to make the change - this will automatically be picked up when you rebuild your gem.

Your new gem provides some Rake tasks for convenience:

* `rake gem` - Build the gem and drop it into the `pkg/` directory for installation.
* `rake test` - The default test task, it will run the tests in `test`. If this is a newly-created gem, your tests will flunk.
* `rake github` - Generate `my_gem.gemspec` file to use if you're serving your gem from GitHub (requires flagging your GitHub project as a rubygem).

That's it. Enjoy.

## License

Copyright (c) 2008 Patrick Reagan (reaganpr@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
