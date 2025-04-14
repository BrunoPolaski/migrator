#!make
include .env

name ?= DefaultMigration
timesToDownMigration ?= 1 

migration-gen:
	@echo "Creating migration"
	$(eval timestamp := $(shell date +%s))
	$(eval folder := $(if $(MIGRATOR_FOLDER_PATH),$(MIGRATOR_FOLDER_PATH),internal/config/migrations))
	@mkdir -p $(folder)
	@touch $(folder)/$(timestamp)_$(name)_down.sql
	@touch $(folder)/$(timestamp)_$(name)_up.sql
	@echo "Migration file created successfully in $(folder)"

migration-run:
	go run migrator.go up

migration-down:
	go run migrator.go down $(timesToDownMigration)

migration-status:
	go run migrator.go status
	
migration-init:
	go run migrator.go init