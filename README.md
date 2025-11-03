# My Personal Website

This is the source code of my [personal website](http://oscarrodriguez.me). It was created using [Jekyll](https://jekyllrb.com) and the nice [kactus](https://github.com/nickbalestra/kactus) theme.
To create the « publications » section, I used the [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) plugin.

Feel free to reuse this code for your own personal website.

## Updating
In order to update the website the following steps are necessary:
1. **Modify** the code in the project accordingly
2. **Compile** the website with the modifications using the command:

```
jekyll build
```

3. **Test** the modifications

```
jekyll serve
```

### Using Docker
Alternatively, you can use Docker to build and test the website. This avoids having to install Jekyll and its dependencies on your local machine.

First, ensure you have a `Gemfile` in the root of your project with the following content:
```ruby
source "https://rubygems.org"
gem "jekyll"
gem "jekyll-scholar"
```

**Build** the website with Docker:
```sh
docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -it jekyll/builder jekyll build
```

**Test** the website with Docker:
```sh
docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -p 4000:4000 -it jekyll/builder jekyll serve --host 0.0.0.0
```
The site will be available at `http://localhost:4000`.

## Publishing
Execute the following script:
```
rake commit_deploy
```
