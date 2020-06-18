clear
echo "Geoffrey George Daniel"
echo "1947222"

echo "1.Demonstrate the commands to change the ownership of a file"
echo "2.Demonstrate the commands to change the group of user."
echo "3.Demonstrate the recursive option to assign file permission"
echo "4.Create a shell script (Permission.sh) to assign the file privileges at the time of creating a file based on  roles"
echo "5.Write a shell script to group and compress the file based on their file extension"
echo "6.Write a shell script to archive the files which are not accessed for past three months"
echo "7.Create a compressed file called Collection.tar and move all the files starting with a specific character to the directory Collection.tar"
echo "8.Compress the files from the current directory which consume more than 1GB"
echo "9.Group and compress the files based on their file permission.(For example compress the file with ‘read’ only/’read&write’/’read,write&execute’)"
echo "Enter your option"
read option
case "$option" in
         1) echo "Enter the file to change the owner"
            read nfile
            echo "current owner of file"
            s= ls -l $nfile
            echo "$s"
            echo "enter the Owner "
            read owner
            sudo chown $owner $nfile
            echo "Latest owner of file"
            o= ls -l $nfile
            echo "$o"
            ;;
         2) echo "Enter the file to change the group"
            read nfile
            echo "current Group of file"
            s= ls -l $nfile
            echo "$s"
            echo "enter the Group "
            read owner
            sudo chgrp $owner $nfile
            echo "Latest Group of file"
            o= ls -l $nfile
            echo "$o"
            ;;
         3) echo "Enter the file to change the group"
            read nfile
            echo "current permission of file"
            s= ls -l $nfile
            echo "$s"
            echo "Enter permission"
            read p
            echo "Recursively Changing file permission "
            sudo chmod -R u=$p,go=$p $nfile
            echo "Latest Group of file"
            o= ls -l $nfile
            echo "$o"
            ;;
         4) echo "Select 1 for Administrator"
	    echo "Select 2 for student"
            echo "Select 3 for faculty"
            read choice
            case $choice in
            1)
              echo "current permission"
              file=permission.sh
              permission= ls -l $file
              echo "$permission"
              echo "Administrator have RWX permission"
              echo "changing permission ..."
              chmod u+rwx permission.sh
              permission= ls -l $file
              echo "$permission"
              ;;
            2)
              echo "current permission"
              file=permission.sh
              permission= ls -l $file
              echo "$permission"
              echo "Faculty have RW permission"
              echo "changing permission ..."
              chmod u-x permission.sh
              permission= ls -l $file
               echo "$permission"
              ;;
            3)
              echo "current permission"
              file=permission.sh
              permission= ls -l $file
              echo "$permission"
              echo "Student have R permission"
              echo "changing permission ..."
              chmod u-wx permission.sh
              permission= ls -l $file
              echo "$permission"
              ;;
           esac
           ;;
         5)  echo "Listing all text files"
            a= find -type f | grep -P '\.txt'
           echo "$a"
           echo "Compressing all files with txt extension"
           find -type f | grep -P '\.txt' | tar cvzf archive.gz -T -
           ;;
         6)echo "Finding all the directories not used in 30 days"
           f=$ find /home/nithin -iname "*.txt" -mtime -30 -exec cat {} \;
           echo "$f"
           find /home/nithin -iname "*.txt" -mtime -30  | tar cvzf month.gz -T -
           ;;
         7)echo "Enter the starting character you want"
		read start
		tar -cvf Collection.tar $start*
           ;;
         9)echo "enter the file permission"
           read per
           g=$ find -perm -a=$per
           echo "files with current permission"
           echo "$g"
           find -perm -a=$per | tar cvzf fileper.gz -T -
           ;;
esac
