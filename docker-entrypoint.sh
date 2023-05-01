#!/bin/bash
bin/rails server -b 0.0.0.0 | bin/rails db:migrate RAILS_ENV=development

