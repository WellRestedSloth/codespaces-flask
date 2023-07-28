#!/bin/bash

gunicorn sse_app:app --worker-class gevent --bind 127.0.0.1:8000

