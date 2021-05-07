.PHONY: deploy

init:
	git worktree remove -f /tmp/bfebook
	git worktree add -f /tmp/bfebook gh-pages

deploy: init
	@echo "====> deploying to github"
	mdbook build
	rm -rf /tmp/bfebook/*
	cp -rp book/* /tmp/bfebook/
	cd /tmp/bfebook && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push -f origin gh-pages