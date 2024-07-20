PHONY: setup clean remove-pre-commit

PRE_COMMIT_FILE = .git/hooks/pre-commit

setup: clean $(PRE_COMMIT_FILE)
	touch ignored.txt
	touch untracked.txt
	touch staged.txt
	git add staged.txt
	git mv not-renamed-yet.txt renamed.txt
	echo "Modified text" >> modified.txt

clean: remove-pre-commit
	git clean -fxd
	git reset --hard

# Adds a pre-commit hook that prevents renamed.txt, staged.txt, and modified.txt from being committed
$(PRE_COMMIT_FILE):
	echo "git diff --cached --name-only | grep -qE 'renamed.txt|staged.txt|modified.txt' && echo Refusing to push renamed.txt, staged.txt or modified.txt && exit 1" > $(PRE_COMMIT_FILE)
	chmod +x $(PRE_COMMIT_FILE)

remove-pre-commit:
	rm -f $(PRE_COMMIT_FILE)
