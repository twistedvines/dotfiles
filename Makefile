install:
	rsync --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude ".gitattributes" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~
