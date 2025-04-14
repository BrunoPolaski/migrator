# Migrator
This is a RDB migrator made in Golang. It is used as a package and reads the migration files from a path passed in parameter to the Exec function.

#### How to use
If you don't have a path to use in `path` parameter inside `Exec` function, you can run `make migration-init` to create the default path and then referrence it. 

You have three main options to use the migrator:
```Makefile
make migration-run # run all migrations

make migration-down # use the parameter 'timesToDownMigration=x'
                    # where x is an unsigned integer if you
                    # want to rollback more than one migration.

make migration-status # check how many migrations have been executed
                      # and the last executed migration aswell.
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
The default output for the files is `internal/config/migrations` but you can change it by adding a .env variable called `MIGRATOR_FOLDER_PATH`.
