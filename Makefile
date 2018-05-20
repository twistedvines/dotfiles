install:
	git archive master --format tar \
		| tar -x -C "${HOME}"
