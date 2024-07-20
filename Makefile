setup: clean
	touch ignored.txt
	touch untracked.txt
	touch staged.txt
	git add staged.txt
	echo "Modified text" >> modified.txt

clean:
	git clean -fxd
	git reset --hard
