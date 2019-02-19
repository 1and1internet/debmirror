# ubuntu-16-debmirror
# debmirror


refactored to use an external config file - 
modify example.debmirror.conf and put in /config/path/debmirror.conf

run with:

docker run -v /repo/path:/debmirror -v /config/path:/status 1and1internet/debmirror

