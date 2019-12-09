#!/bin/sh -x


### Verify Step
PYTHONPATH=src/ mkdocs serve --verbose --strict &
sleep 10
timeout 30 bash -c 'until (echo > /dev/tcp/localhost/8000); do sleep 0.5; done' > /dev/null 2>&1

if `which linkchecker &>/dev/null`; then
    timeout 600 bash -c 'linkchecker --config=ci/linkchecker.config http://localhost:8000/'
    rc=$?
else
    wget http://localhost:8000
    rc=$?
fi

# cleanup after ourselves
pkill mkdocs
exit $rc


### Build the site
PYTHONPATH=src/ mkdocs build -v
