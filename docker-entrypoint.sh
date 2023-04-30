#!/bin/bash
bin/rails db:create db:migrate  db:seed RAILS_ENV=development && bin/rails server -b 0.0.0.0 

