# README

![Generic badge](https://bistomd-build-badges.s3.amazonaws.com/main-build.svg)
[![Code](https://github.com/bistromd/menuadmin/actions/workflows/rubyonrails.yml/badge.svg?branch=master)](https://github.com/bistromd/menuadmin/actions/workflows/rubyonrails.yml)
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/andrewpaliyan/76542fd18be0a6db223c95ffd20e12a0/raw/menuadmin.json)
![Generic badge](https://bistomd-build-badges.s3.amazonaws.com/build-tag.svg)

Build Steps Below:
# Steps to start development - First time (MAC):

1. Download and install [Docker Compose](https://docs.docker.com/compose/install/)
2. Clone repo
3. cd into repo
4. Run the following commands
```bash
docker-compose build
docker-compose run web yarn install    
docker-compose run web bundle install     
docker-compose run web rails db:drop db:create db:migrate db:seed
docker-compose up
```

# Steps to continuing a project (MAC):
```bash
docker-compose run web db:migrate
docker-compose up
```

# To run all code checks manually

```bash
./bin/run_checks
```

# To force checks on commits 
### requires all gems to be installed locally or requires git actions to be performed using docker-compose
### enable only if you are comfortable with performing checks on commit

```bash
overcommit --install
```

### To perform git actions using docker-compose

```bash
./bin/git commit -m "TKT-121 | Add fix for code"
```
