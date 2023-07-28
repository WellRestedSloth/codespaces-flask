# Flask-SSE Demo

This is a very simple Flask-SSE demo, based on the Flask-SSE demo at [bigboxcode - Flask Server Sent Events SSE](https://bigboxcode.com/flask-server-sent-events-sse).

Development was done using Github Codespaces.

To run this application:

1. Start a Redis instance (listening at default port 6379).

    On Github Codespaces, I created a script that runs a Docker instance of Redis.  You can run the script:

    ```
    ./redis_docker.sh
    ```

    Or you can execute the following commands in the Github Codespaces terminal:

    ```
    docker pull redis
    docker run --rm --name local-redis -p 6379:6379 -d redis
    ```

2. Run the web server.

    I created a script that runs the Gunicorn web server on port 8000.  You can run the script:

    ```
    ./run.sh
    ```

    Or you can execute the following command in the Github Codespaces terminal:

    ```
    gunicorn sse_app:app --worker-class gevent --bind 127.0.0.1:8000
    ```

3. If all goes well, load the website in a web browser.  Go to:

    ```
    http://localhost:8000
    ```

4. Send POST JSON messages via the "publish" route, and it should be displayed in the web browser.  You can do this using an app like "Postman".

    Example:

    POST to ```localhost:8000/publish```

    ```
    {
        "id": 1,
        "test": "The quick brown fox jumps over the lazy dog.",
        "website": "https://github.com"
    }
    ```

    In the web browser you should now see the line:

    ```
    {"id": 1, "test": "The quick brown fox jumps over the lazy dog.", "website": "https://github.com"}
    ```

    You can keep POSTing more JSON to the "publish" route, and the web browser will append the data to the end.

    Enjoy!
