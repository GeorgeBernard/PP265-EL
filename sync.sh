#! /bin/bash -x

DAV_SERVER=https://sakai.duke.edu/dav/0ba14dfb-b276-46ce-98a0-a6b8020369da

mkdir sync_temp

sudo mount -t davfs $DAV_SERVER sync_temp

rsync -av sync_temp/ resources

sudo umount -t davfs $DAV_SERVER

rmdir sync_temp
