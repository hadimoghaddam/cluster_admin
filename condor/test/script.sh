#!/bin/bash
echo "***** Start boot script! *****"
if [ "${RUNSCRIPT_VAR+set}" != set ]
then
    # Signal our future self that it's safe to continue
    echo "RUNSCRIPT_VAR not set! Setting it ..."
    export RUNSCRIPT_VAR=1
else
        # We've already executed once, so we should exit
        echo "calling m5 exit!"
        /sbin/m5 exit 1
fi

/sbin/m5 checkpoint

#THIS IS WHERE EXECUTION BEGINS FROM AFTER RESTORING FROM CKPT
if [ "$RUNSCRIPT_VAR" -eq 1 ]
then

    # Signal our future self not to recurse infinitely
    export RUNSCRIPT_VAR=2
    echo "3. RUNSCRIPT_VAR is $RUNSCRIPT_VAR"

    # Read the script for the checkpoint restored execution
    echo "Loading new script..."
    /sbin/m5 readfile > /tmp/runscript1.sh

    # Execute the new runscript
    if [ -s /tmp/runscript1.sh ]
    then
        echo "executing newly loaded script ..."
        /bin/bash /tmp/runscript1.sh

    else
        echo "Script not specified. Dropping into shell..."
    fi

fi

echo "Fell through script. Exiting..."
/sbin/m5 exit 1
