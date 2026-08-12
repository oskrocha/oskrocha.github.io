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
Alternatively, you can build and publish through Docker (`Dockerfile` / `docker-compose.yml`), which avoids installing Jekyll/Ruby on the host entirely and is the recommended way to run the Rakefile tasks below:

```sh
docker compose run --rm site rake build:pro
```

## Publishing
This repo has two branches: `source` (Jekyll source + built `_site/`) and `master` (generated site output only, served by GitHub Pages — never edit it directly, it's fully rebuilt from `_site/` on every deploy).

Publish with:
```sh
docker compose run --rm site rake commit_deploy
```
This commits `_site/` on `source`, pushes it, then rebuilds `master` from `_site/` and force-pushes it.
