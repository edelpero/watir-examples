#**Heroku, Ruby on Rails and PhantomJS**

In this post, I’m going to show you how to modify an existing Ruby on Rails app running on Heroku’s Cedar stack to use PhantomJS for screen scraping. If you’ve never heard of PhantomJS, it’s a command-line WebKit-based browser (that supports JavaScript, cookies, etc.).

Let’s get started. This is a high-level overview of the required steps:

* Modify your app to use multiple Heroku buildpacks.
* Extend your app to use both the Ruby as well as the PhantomJS buildpacks.
* Confirm that everything worked.

David Dollar has created Heroku buildpack that allows you to use multiple Heroku buildpacks for your app. ;-) Install it by setting an environment variable:

```bash
$ heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
```

Extend your app to use both the Ruby as well as the PhantomJS buildpacks

Create a `.buildpacks` file in the root directory of your app:

```bash
$ touch .buildpacks
```
Within your .buildpacks file, specify that your app uses both the Ruby and the PhantomJS buildpacks. This prevents you from having to (cross-)compile PhantomJS yourself. Make the contents of your .buildpacks file:

```
https://github.com/heroku/heroku-buildpack-ruby
https://github.com/stomita/heroku-buildpack-phantomjs
```

PhantonJS has a dependency on libQtWebKit.so.4, which the PhantomJS buildpack installs on Heroku in/app/vendor/phantomjs/lib. Modify your Heroku app’s LD_LIBRARY_PATH to include this directory:

```bash
$ heroku config:set PATH="/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin"
$ heroku config:set LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib
```
Confirm that everything worked

First things first - load your app in your web browser and confirm that it still comes up. :-)  Next, launch a Heroku bash shell:

```bash
$ heroku run bash
```
Within the bash shell, invoke the PhantomJS executable to ensure that it runs:

```bash
$ vendor/phantomjs/bin/phantomjs —version
```
Good to go!  Now you’re ready to call PhantomJS from your Ruby code.