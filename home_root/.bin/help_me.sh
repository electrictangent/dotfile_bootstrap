#!/bin/bash
# Disables echi / ohci / uhci ports on suspend and reenables them on resume. 
# Place this script in /etc/pm/sleep.d


function unbind_usb {
    for driver in ehci ohci uhci; do
        cd "/sys/bus/pci/drivers/${driver}_hcd";
        ids=$(ls | grep :);
        echo $ids > /tmp/DISABLED_$driver;
        for id in $ids; do
            echo "Unbinding $id";
            echo -n "$id" > unbind;
            disabled="$disabled $id";
        done;
    done;
}

function bind_usb {
    for driver in ehci ohci uhci; do
        cd "/sys/bus/pci/drivers/${driver}_hcd";
        for id in $(cat /tmp/DISABLED_$driver); do
            echo "Binding $id";
            echo -n "$id" > bind;
        done;
        rm /tmp/DISABLED_$driver;
    done;
}

case "$1" in
    hibernate|suspend)
        unbind_usb;
    ;;
    thaw|resume)
        bind_usb;
        # Uncomment the following two lines if USB devices stutter after resume
        # unbind_usb;
        # bind_usb;
    ;;
    *)
    exit 1;
    ;;
esac;
exit 0;
