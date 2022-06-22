#/bin/sh
Device=$1
DISK=$2
case $DISK in
        await)
            iostat -dxkt 1 1|grep "\b$Device\b" |tail -1|awk '{print $10}'
            ;;
        svctm)
            iostat -dxkt 1 1|grep "\b$Device\b" |tail -1|awk '{print $13}'
            ;;
         util)
            iostat -dxkt 1 1|grep "\b$Device\b" |tail -1|awk '{print $14}'
            ;;
        iops)
            iostat |grep "\b$Device\b"|tail -1|awk '{print $2}'
	;;
esac
