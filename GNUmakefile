.PHONY: update-repos
update-repos: gazelle
	@bazelisk run //:gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%go_dependencies

.PHONY: gazelle
gazelle:
	@bazelisk run //:gazelle

.PHONY: test
test: update-repos
	@bazelisk test //...

.PHONY: clean
clean:
	@bazelisk clean

.PHONY: update-repos
build:
	@bazelisk build //...
	@bazelisk run //cmd/server:image

.PHONY: push
push:
	@bazelisk run //cmd/server:bundle_push

.PHONY: all
all: gazelle build test