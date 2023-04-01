.PHONY: update-repos
update-repos: gazelle
	@bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%go_dependencies

.PHONY: gazelle
gazelle:
	@bazel run //:gazelle

.PHONY: test
test: update-repos
	@bazel test //...

.PHONY: clean
clean:
	@bazel clean

.PHONY: update-repos gazelle
build:
	@bazel build //...

.PHONY: push
push:
	@bazel run //cmd/server:push_index

.PHONY: all
all: gazelle build test
