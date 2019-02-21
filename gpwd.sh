# ~~~~~~~~~~~~~~~         GPWD         ~~~~~~~~~~~~~~~

#constants
HDD_DIR="/mnt/disk1"
PWD_DIR="/mnt/veracrypt_volume"
ENC_CONT="SECURE.vera" #filename for encrypted file container
BASENAME=$0

if [ -d $PWD_DIR ] 
then
    cat $PWD_DIR/$1* | grep -i "username\|email\|phone\|password"
else
    echo "Directory $PWD_DIR does not exist."
    #check that harddrive is mounted with veracrypt
    if [ -d $HDD_DIR ] 
    then
        echo "Mounting $ENC_CONT..."
        veracrypt $PASSWORD $HDD_DIR/Vera/$ENC_CONT $PWD_DIR
        sleep 3
        #wait until user finishes mounting
        until [ -d $PWD_DIR ]
        do
            sleep 1
        done
        #call this script recursively
        $BASENAME $1 && exit
    else
        echo "No volume mounted at $HDD_DIR. Exiting..."
        exit
    fi
fi

