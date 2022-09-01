#!/usr/bin/env zsh

if [[ $UID != 0 ]]; then
    echo "This must be run as root."
    exit 1
fi

function iface_up() {
    ip netns add bckupvpn

    ip netns exec bckupvpn ip addr add 127.0.0.1/8 dev lo
    ip netns exec bckupvpn ip link set lo up

    ip link add vpn0 type veth peer name vpn1
    ip link set vpn0 up
    ip link set vpn1 netns bckupvpn up

    ip addr add 10.200.200.1/24 dev vpn0
    ip netns exec bckupvpn ip addr add 10.200.200.2/24 dev vpn1
    ip netns exec bckupvpn ip route add default via 10.200.200.1 dev vpn1

    iptables -A INPUT \! -i vpn0 -s 10.200.200.0/24 -j DROP
    iptables -t nat -A POSTROUTING -s 10.200.200.0/24 -o wl+ -j MASQUERADE

    sysctl -q net.ipv4.ip_forward=1

    mkdir -p /etc/netns/bckupvpn
    echo 'nameserver 1.1.1.1\nnameserver 8.8.8.8' > /etc/netns/bckupvpn/resolv.conf

    echo 'If ping command suceeds, network namespace setup was successful.'
    ip netns exec bckupvpn ping google.com
}

function iface_down() {
    rm -rf /etc/netns/bckupvpn

    sysctl -q net.ipv4.ip_forward=0

    iptables -D INPUT \! -i vpn0 -s 10.200.200.0/24 -j DROP
    iptables -t nat -D POSTROUTING -s 10.200.200.0/24 -o wl+ -j MASQUERADE

    ip netns delete bckupvpn
}

function run() {
    shift
    exec sudo ip netns exec bckupvpn "$@"
}

function start_vpn() {
    sudo ip netns exec bckupvpn openvpn --config /home/ethan/.config/strawberry.ovpn &

    while ! sudo ip netns exec bckupvpn ip a show dev tun0 up; do
        sleep .5
    done
}

case "$1" in
    up)
        iface_up ;;
    down)
        iface_down ;;
    run)
        run "$@" ;;
    start_vpn)
        start_vpn ;;
    *)
        echo "Syntax: $0 up|down|run|start_vpn"
        exit 1
        ;;
esac
