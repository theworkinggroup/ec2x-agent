#!/usr/bin/env ruby

SYSTEM_SAMPLE = {
  :darwin => {
    :ifconfig => ''
  },
  :linux => {
    :ifconfig => ""
  }
}

__END__
DARWIN IFCONFIG
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 
	inet 127.0.0.1 netmask 0xff000000 
	inet6 ::1 prefixlen 128 
gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
stf0: flags=0<> mtu 1280
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	ether 00:1f:5b:ea:f8:fd 
	media: autoselect status: inactive
	supported media: autoselect 10baseT/UTP <half-duplex> 10baseT/UTP <full-duplex> 10baseT/UTP <full-duplex,hw-loopback> 10baseT/UTP <full-duplex,flow-control> 100baseTX <half-duplex> 100baseTX <full-duplex> 100baseTX <full-duplex,hw-loopback> 100baseTX <full-duplex,flow-control> 1000baseT <full-duplex> 1000baseT <full-duplex,hw-loopback> 1000baseT <full-duplex,flow-control> none
fw0: flags=8822<BROADCAST,SMART,SIMPLEX,MULTICAST> mtu 4078
	lladdr 00:1f:f3:ff:fe:0e:2d:66 
	media: autoselect <full-duplex> status: inactive
	supported media: autoselect <full-duplex>
en1: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	inet6 fe80::21e:c2ff:febf:f48f%en1 prefixlen 64 scopeid 0x6 
	inet 192.168.2.2 netmask 0xffffff00 broadcast 192.168.2.255
	ether 00:1e:c2:bf:f4:8f 
	media: autoselect status: active
	supported media: autoselect
vmnet8: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	inet 172.16.153.1 netmask 0xffffff00 broadcast 172.16.153.255
	ether 00:50:56:c0:00:08 
vmnet1: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	inet 192.168.227.1 netmask 0xffffff00 broadcast 192.168.227.255
	ether 00:50:56:c0:00:01 
LINUX IFCONFIG
eth0      Link encap:Ethernet  HWaddr FE:FD:48:0E:B3:34  
          inet addr:72.14.179.52  Bcast:72.14.179.255  Mask:255.255.255.0
          inet6 addr: fe80::fcfd:48ff:fe0e:b334/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:80859654 errors:0 dropped:0 overruns:0 frame:0
          TX packets:35209437 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1858630023 (1.7 GiB)  TX bytes:2241711087 (2.0 GiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:4818025 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4818025 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:1523027113 (1.4 GiB)  TX bytes:1523027113 (1.4 GiB)
