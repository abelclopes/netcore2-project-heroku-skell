# netcore2 project heroku skell

[![Build status](https://ci.appveyor.com/api/projects/status/4jgl48q7cfg2h46m?svg=true)](https://ci.appveyor.com/project/abelclopes/netcore2-project-heroku-skell)



## Deploy to Heroku

### Manual

Using custom buildpack [dotnetcore-buildpack](https://github.com/jincod/dotnetcore-buildpack)

```bash
heroku buildpacks:set https://github.com/jincod/dotnetcore-buildpack
heroku buildpacks:add --index 1 heroku/nodejs
```

### Heroku Deploy button

Click the button below to set up this sample app on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/abelclopes/netcore2-project-heroku-skell)
