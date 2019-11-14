read -p "pls input mdt node name: " name
read -p "pls input mdt device [sdb]: " mdt
read -p "pls input ost0 device [sdc]: " ost0
read -p "pls input ost1 device [sdd]: " ost1

mkdir /mdt
mkdir /ost1
mkdir /ost2

mkfs.lustre --fsname=lustrefs --mgs --mdt --index=0 /dev/$mdt
mount.lustre /dev/$mdt /mdt

mkfs.lustre --fsname=lustrefs --mgsnode=$name@tcp --ost --index=0 /dev/$ost0
mount.lustre /dev/$ost0 /ost0

mkfs.lustre --fsname=lustrefs --mgsnode=$name@tcp --ost --index=1 /dev/$ost1
mount.lustre /dev/$ost1 /ost1

lctl dl
