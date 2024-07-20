setup: clean
	touch ignored.txt
	touch untracked.txt
	touch staged.txt
	git add staged.txt
	git mv not-renamed-yet.txt renamed.txt
	echo "Modified text" >> modified.txt

clean:
	git clean -fxd
	git reset --hard
