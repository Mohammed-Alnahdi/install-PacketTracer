#!/bin/bash


#Perpare for Setup

echo "Hello in installation Packet Tracer in Gnu/Linux"
echo "Preparing to install ... "

DIR="/tmp/Installation-PacketTracer/"

if [ -d "$DIR" ]; then
	rm -rf "$DIR"
else
	mkdir /tmp/Installation-PacketTracer/
fi
cp CiscoPacketTracer_801_Ubuntu_64bit.deb /tmp/Installation-PacketTracer/
cd /tmp/Installation-PacketTracer/
ar -xv CiscoPacketTracer_801_Ubuntu_64bit.deb
mkdir control
tar -C control -Jxf control.tar.xz
mkdir data
tar -C data -Jxf data.tar.xz
cd data


#remove the previous version before installation

rm -rf /opt/pt
rm -rf /usr/share/applications/cisco-pt7.desktop
rm -rf /usr/share/applications/Cisco-ptsa7.desktop
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pka.png
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pkt.png
rm -rf /usr/share/icons/gnome/48x48/mimetypes/pkz.png
rm -rf /usr/share/mime/packages/cisco-pka.xml
rm -rf /usr/share/mime/packages/cisco-pkt.xml
rm -rf /usr/share/mime/packages/cisco-pkz.xml

# Copy files of installation 

cp -r usr /
cp -r opt / 

# installation Desktop
xdg-desktop-menu install /usr/share/application/cisco-pt.desktop
xdg-desktop-menu install /usr/share/application/cisco-ptsa.desktop
update-mime-database /usr/share/mime
gtk-update-icon-cache -ft /usr/share/icons/gnome
xdg-mime default cisco-ptsa.desktop x-scheme-hanler/pttp

# Finalization installation 

rm -rf /tmp/Installation-PacketTracer/
echo ""
echo "If there any issue please report in Github @Mohammed-Alnahdi"
echo ""
echo "or send an email to mohammed.alnahdi1991@gmail.com"
echo "Press <ENTER> to continue"
echo ""
read
echo "Have a nice studying, Good Bye!"
echo ""

