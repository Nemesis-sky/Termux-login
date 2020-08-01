#!/data/data/com.termux/files/usr/bin/bash
ask_for_pass()
{
	read -p $'\033[1m\033[38;5;208mEnter new username\e[0m   ' username
	echo "$username" | tee $PREFIX/etc/log.log
	read -p $'\033[1mEnter new password   ' pass
	echo "$pass" | tee $PREFIX/etc/log2.log
	echo -e "\e[5mRecovery key is used to reset password enter to continue\e[0m"
	read
        read -p $'\033[38;5;22m\033[1mEnter recovery key\033[0m   ' recovery
	echo -e "$recovery" | tee $PREFIX/etc/log3.log
	name=$(cat $PREFIX/etc/log.log)
}
comparing()
{
	name=$(cat $PREFIX/etc/log.log)
	password=$(cat $PREFIX/etc/log2.log)
	recover=$(cat $PREFIX/etc/log3.log)
	j=0
	while [ $j = 0 ]
	do
		read -p $'\033[1m\033[32musername\033[0m   ' username2
		if [ $username2 = $name ]
		then
			j=1
		else
			echo -e "\e[1m\e[31musername not exist\e[0m"
			j=0
		fi
	done
	echo ""
	echo ""
	i=0
	while [ $i = 0 ]
	do
		read -sp $'\033[1m\033[32mpassword\033[0m   ' pass2
		echo ""
		if [ $pass2 = $password ]
		then
			i=1
		elif [ $pass2 = $recover ]
		     then
			ask_for_pass
			i=1
		     else
			echo -e "\e[1m\e[31minvalid password Enter recovery key for reset\e[0m"
			i=0
		fi
	done
}
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-" | lolcat
echo "-+                  TERMUX LOGIN V 1.0               +-" | lolcat
echo "-+---------------------------------------------------+-" | lolcat
echo "-+        Created by Nemesis-Sky(Akash Murhe)        +-" | lolcat
echo "-+---------------------------------------------------+-" | lolcat
echo "-+    Github:- https://github.com/Nemesis-sky        +-" | lolcat
echo "-+---------------------------------------------------+-" | lolcat
echo "-+Insta Id:-https://www.instagram.com/akashmurhe777/ +-" | lolcat
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-" | lolcat
echo ""   | lolcat




if [ -e $PREFIX/etc/log.log ]
then
	comparing
else
	ask_for_pass
fi



