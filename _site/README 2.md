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

## Publishing
Execute the following script:
```
rake commit_deploy
```
