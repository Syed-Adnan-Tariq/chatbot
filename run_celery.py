from temba.temba_celery import app

app.start(argv=["celery", "--beat", "-A", "temba", "worker", '-Q', 'celery,flows,msgs,handler,ai_training', "-l", "info"])
