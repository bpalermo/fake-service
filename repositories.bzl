load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BAZEL_SKYLIB_SHA = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7"
BAZEL_SKYLIB_VERSION = "1.4.1"

BAZEL_ZIG_CC_SHA = "e9f82bfb74b3df5ca0e67f4d4989e7f1f7ce3386c295fd7fda881ab91f83e509"
BAZEL_ZIG_CC_VERSION = "v1.0.1"

RULE_PKG_SHA = "335632735e625d408870ec3e361e192e99ef7462315caa887417f4d88c4c8fb8"
RULE_PKG_VERSION = "0.9.0"

RULES_GO_SHA = "6b65cb7917b4d1709f9410ffe00ecf3e160edf674b78c54a894471320862184f"
RULES_GO_VERSION = "v0.39.0"

BAZEL_GAZELLE_SHA = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d"
BAZEL_GAZELLE_VERSION = "v0.29.0"

RULES_OCI_SHA = "f6125c9a123a2ac58fb6b13b4b8d4631827db9cfac025f434bbbefbd97953f7c"
RULES_OCI_VERSION = "0.3.9"

def repositories():
    if not native.existing_rule("bazel_skylib"):
        http_archive(
            name = "bazel_skylib",
            sha256 = BAZEL_SKYLIB_SHA,
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{0}/bazel-skylib-{0}.tar.gz".format(BAZEL_SKYLIB_VERSION),
                "https://github.com/bazelbuild/bazel-skylib/releases/download/{0}/bazel-skylib-{0}.tar.gz".format(BAZEL_SKYLIB_VERSION),
            ],
        )

    if not native.existing_rule("bazel-zig-cc"):
        http_archive(
            name = "bazel-zig-cc",
            sha256 = BAZEL_ZIG_CC_SHA,
            strip_prefix = "bazel-zig-cc-{}".format(BAZEL_ZIG_CC_VERSION),
            urls = [
                "https://mirror.bazel.build/github.com/uber/bazel-zig-cc/releases/download/{0}/{0}.tar.gz".format(BAZEL_ZIG_CC_VERSION),
                "https://github.com/uber/bazel-zig-cc/releases/download/{0}/{0}.tar.gz".format(BAZEL_ZIG_CC_VERSION),
            ],
        )

    if not native.existing_rule("rules_pkg"):
        http_archive(
            name = "rules_pkg",
            sha256 = RULE_PKG_SHA,
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/{}/rules_pkg-{}.tar.gz".format(RULE_PKG_VERSION, RULE_PKG_VERSION),
                "https://github.com/bazelbuild/rules_pkg/releases/download/{}/rules_pkg-{}.tar.gz".format(RULE_PKG_VERSION, RULE_PKG_VERSION),
            ],
        )

    if not native.existing_rule("io_bazel_rules_go"):
        http_archive(
            name = "io_bazel_rules_go",
            sha256 = RULES_GO_SHA,
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/{}/rules_go-{}.zip".format(RULES_GO_VERSION, RULES_GO_VERSION),
                "https://github.com/bazelbuild/rules_go/releases/download/{}/rules_go-{}.zip".format(RULES_GO_VERSION, RULES_GO_VERSION),
            ],
        )

    if not native.existing_rule("bazel_gazelle"):
        http_archive(
            name = "bazel_gazelle",
            sha256 = BAZEL_GAZELLE_SHA,
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/{}/bazel-gazelle-{}.tar.gz".format(BAZEL_GAZELLE_VERSION, BAZEL_GAZELLE_VERSION),
                "https://github.com/bazelbuild/bazel-gazelle/releases/download/{}/bazel-gazelle-{}.tar.gz".format(BAZEL_GAZELLE_VERSION, BAZEL_GAZELLE_VERSION),
            ],
        )

    if not native.existing_rule("rules_oci"):
        http_archive(
            name = "rules_oci",
            sha256 = RULES_OCI_SHA,
            strip_prefix = "rules_oci-{}".format(RULES_OCI_VERSION),
            url = "https://github.com/bazel-contrib/rules_oci/releases/download/v{}/rules_oci-v{}.tar.gz".format(RULES_OCI_VERSION, RULES_OCI_VERSION),
        )

    if not native.existing_rule("io_bazel_rules_docker"):
        http_archive(
            name = "io_bazel_rules_docker",
            sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
            urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
        )
