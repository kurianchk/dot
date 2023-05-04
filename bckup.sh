bck(){
	nohup tar -czf ~/$1.tar $1 >> ~/backup/backup.log 2>&1 &
	mv ~/$1.tar ~/backup
}
