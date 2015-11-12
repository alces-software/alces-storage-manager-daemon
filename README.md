# Alces Storage Manager Daemon
Copyright (C) 2007-2015 Stephen F. Norledge and Alces Software Ltd. See LICENSE.txt.


## Description
Alces Storage Manager Daemon is the backend to the Alces Storage Manager, a
web-based file manager designed to provide users with a means to manage
uploading, downloading and manipulating files in their cluster storage via
their web browser.

The ASM Daemon provides PAM-based authentication and filesystem access to the
ASM web application.

## Configuration
Alces Storage Manager is a Ruby application. You must have Ruby installed
before installing Alces Storage Manager Daemon.

1. Clone the git repository:

   ```$ git clone git@github.com:alces-software/alces-storage-manager-daemon.git```

2. From your repository, install Ruby dependencies with bundler:

   ```$ bundle install```

3. Configure the Storage Manager Daemon by editing the 
  `config/storage-manager-daemon.yml`file. A sample configuration file is
  provided at `config/storage-manager-daemon.yml.ex`. The options within this
  file are as follows:
    * `interfaces`: List of network interfaces (by IP address) for the daemon to
    listen on. The wildcard `*` binds to all interfaces.
    * `port`: The port on which to listen. Default is `25268`.
    * `log_file`: Path to log file. Defaults to `log/daemon.log`.
    * `configs`: Additional configuration files to load. The SSL configuration is
      included in this way. A `.yml` file extension is assumed.

4. Ensure PAM is configured to allow ASMD to authenticate. This can usually be
   done by copying the file in `config/etc/pam.d` into the `/etc/pam.d/`
   directory and restarting PAM.

5. Start Alces Storage Manager Daemon by running as root
   ```# ./bin/alces-storage-manager-daemon```

In production environments, it is often desirable to run ASMD as a persistent
daemon. An init script is provided in `config/etc/init.d` for this purpose.