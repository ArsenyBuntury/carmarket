#!/bin/bash
bin/rails server -b 0.0.0.0 | bin/rails db:create RAILS_ENV=development | bin/rails db:migrate RAILS_ENV=development

