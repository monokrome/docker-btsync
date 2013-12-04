docker-btsync
=============

Deploys a btsync server through docker.

Easy Setup 
----------

If you want to use btsync *with the webui*, but *without any advanced
configurations*, you can run it in docker with the following command:

    docker run -i -t -d -p 8888:8888 monokrome/btsync

If you preferred to run the webui, as an example, on port 8000 instead:

    docker run -i -t -d -p 8000:8888 monokrome/btsync

Upon logging into the site, the default *username* will be set to `admin` and
the default *password* will also be set to `admin`. It is recommended that you
change the password immediately after installation. This can be done by
visiting the **Preferences** page after logging in.

Advanced Configuration
----------------------

If you instead prefer to configure btsync yourself, you just need to set up a
[Dockerfile][df] like the following:

    FROM monokrome/btsync
    MAINTAINER Your Name <youremail@example.com>

    ADD btsync.config /usr/local/etc/btsync.config

Next to that file, add your custom configurations as a btsync.config file in
the same directory as your Dockerfile and run the following command in the same
directory to create a new image with it:

    docker build -t yourorganization/btsync .

Now, you can run your own btsync configuration with the following command:

    docker run -i -t -d -p 8888:8888 yourorganization/btsync

Of course, you can build your image with whatever name you'd like if you prefer
to use a name other than *yourorganization*.


[df]: http://docs.docker.io/en/latest/use/builder/ "Dockerfile for images"
