# Migrator
This is a RDB migrator made in Golang. It is used as a package and reads the migration files from a default path (`/internal/config/migrations`). The path can be changed by including `MIGRATOR_FOLDER_PATH` variable inside the .env file.

#### How to use
If you don't have a path to use in `MIGRATOR_FOLDER_PATH`, you can run `make migration init` to create the default path. 

You have three main options to use the migrator:
```Makefile
make migration-run # run all migrations

make migration-down # use the parameter 'timesToDownMigration=x'
                    # where x is an unsigned integer if you
                    # want to rollback more than one migration.

make migration-status # check how many migrations have been executed
                      # and the last executed migration aswell.
```

Needed `.env` variables are:
```Makefile
ENV=local  # ex: "local", "prod", "dev".

DB_NAME # ex: "customers-service"
DB_USERNAME # ex: "admin"
DB_PASSWORD # ex: "admin"
DB_HOST # ex: "localhost"
DB_PORT # ex: "3306"
DB_TYPE # ex: "mysql", "postgres". The driver used in the connection.
```

> [!WARNING]
> Please change the values in the examples.

> [!IMPORTANT]
> The current version supports only mysql and postgres.

#### Migration file standart
The migration file standart is:
`path/to/migrations/folder/<timestamp>_<migration-name>_<up|down>.sql`

Note that the files are written in SQL language.

If you want to generate a new migration, you can run:
```Makefile
make migration-gen # use the parameter 'name=y'
                   # where y is any alphanumeric. This will create
                   # the migration_<up|down> files for you
                   # with the name passed as input.
```