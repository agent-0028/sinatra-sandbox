# sinatra-sandbox

> Making Sinatra do something useful...in a container.

## Getting Started

You should be able to do all your development and testing in the Docker container without using your locally installed Ruby. Of course, if you know what you are doing and want to run this against local Ruby knock yourself out.

The default, `docker-compose.yml` is set up for development, this folder is linked to `/var/www/docker-sinatra` in the container.

* Install Docker for your operating system
* Run `docker-compose up -d`

The first time you run the commands below, you should see this output after the wall of text:

> WARNING: Image for service app was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.

Since `bundle install` and `apt-get` are run as part of the build process (check the Dockerfile), you will need to rebuild if you change the Gemfile or modify other OS level dependencies.

Now that this is all done, time to take a break. This will nicely shut down the container without deleting any of the build artifacts.

* Run `docker-compose stop`

## Daily Operations

`docker-compose start`

`docker-compose exec app rspec spec/request`

`docker-compose exec app rspec spec/unot`

`docker-compose stop`

## Building an image

Log in to Docker Hub.

Update the tag by changing the `image` field in `docker-compose-build.yml` and `docker-compose-deploy.yml`.

```
docker-compose --file docker-compose-build.yml build
# for example 'tinisi/agent-0028-sinatra-sandbox:v0.1'
docker push REPO/IMAGE_NAME:TAG
```

## Starting app on remote Docker host

Make sure your environment is set up to point to a remote Docker host.

Double check the tag specified in the `image` field of `docker-compose-deploy.yml`.

```
docker-compose \
--file docker-compose-deploy.yml \
up \
--detach
```

## To poke around in a running remote image

```
docker-compose exec app bash
```
