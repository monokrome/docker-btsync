docker-btsync
=============

Deploys a btsync server through docker.

Easy Setup 
----------

If you want to use btsync *with the webui*, but *without any advanced
configurations*, you can run it in docker with the following command:

    docker run -i -t -d -p 6880:6880 -p 8888:8888 monokrome/btsync

If you preferred to run the webui, as an example, on port 8000 instead:

    docker run -i -t -d -p 6880:6880 -p 8000:8888 monokrome/btsync

Upon logging into the site, the default *username* will be set to `admin` and
the default *password* will also be set to `admin`. It is recommended that you
change the password immediately after installation. This can be done by
visiting the **Preferences** page after logging in.

Advanced Configuration
----------------------

If you don't like the [default configuration][btsync.config], you can instead
opt to configure btsync yourself, you just need to set up a [Dockerfile][df]
like the following:

    FROM monokrome/btsync
    MAINTAINER Your Name <youremail@example.com>

    ADD btsync.config /usr/local/etc/btsync.config

Next to that file, add your custom configurations as a btsync.config file in
the same directory as your Dockerfile and run the following command in the same
directory to create a new image with it:

    docker build -t yourorganization/btsync .

Now, you can run your own btsync configuration with the following command:

    docker run -i -t -d -p 6880:6880 -p 8888:8888 yourorganization/btsync

Of course, you can build your image with whatever name you'd like if you prefer
to use a name other than *yourorganization*.

By default, this image has btsync listening on port 6880. If you change the
`listening_port` option, then you will need to change the command accordingly.
As an example, if you wanted the `listening_port` setting to be 9999, then you
would do this:

    docker run -i -t -d -p 9999:9999 -p 8888:8888 yourorganization/btsync

It is important to note, however, that the `listening_port` option is fine as
it is defaulted - because that is only the listening port *inside* of the
docker container. You still can map it to whichever port you want on the host
by exposing it differently using the `-p` option as desired. For instance, you
could change the port for the default configuration to 2222 by using the
following command:

    docker run -i -t -d -p 2222:6880 -p 8888:8888 yourorganization/btsync


[df]: http://docs.docker.io/en/latest/use/builder/ "Dockerfile for images"
[btsync.config]: https://github.com/monokrome/docker-btsync/blob/master/btsync.config
