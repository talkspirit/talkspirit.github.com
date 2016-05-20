build:
	docker run --rm --label=jekyll --volume=$(shell pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/builder:pages

serve:
	docker run --rm --label=jekyll --volume=$(shell pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages

.PHONY: build serve
