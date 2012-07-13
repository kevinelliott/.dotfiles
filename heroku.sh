if [ -n `which heroku` ]; then
  alias gph='git push heroku HEAD:master'
  alias h='heroku'

  function heroku_header {
    echo ''
    echo '=================================================='
    echo $1
    echo '=================================================='
    echo ''
  }
  function heroku_pg_last_backup_name {
    heroku pgbackups | tail -n 1 | cut -d"|" -f 1
  }
  function heroku_pg_remove_backup {
    heroku pgbackups:destroy $1
  }
  function heroku_pg_cleanup {
    heroku_header 'CLEANUP'
    old_backup=$(heroku_pg_last_backup_name)
    heroku_pg_remove_backup $old_backup
  }
  function heroku_pg_capture {
    heroku_header 'CAPTURE'
    echo 'Capturing new backup...'
    heroku pgbackups:capture
  }
  function heroku_pg_pull {
    heroku_pg_cleanup
    heroku_pg_capture

    heroku_header 'FETCH & LOCAL RESTORE'
    curl -o /tmp/latest.dump `heroku pgbackups:url` && pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $1 /tmp/latest.dump
  }
  function heroku_pg_push {
    echo 'Pushing local database to remote database'
  }
  function heroku_pg_backup {
    heroku_pg_cleanup
    heroku_pg_capture
    echo 'Backing up remote database and storing locally'
  }
  alias pgpull='heroku_pg_capture && heroku_pg_pull $1'
  alias pgpull_last='heroku_pg_pull $1'
fi
