load("@rules_oci//oci:pull.bzl", "oci_pull")

def pull_images():
    oci_pull(
        name = "distroless_base_nonroot",
        digest = "sha256:e406b1da09bc455495417a809efe48a03c48011a89f6eb57b0ab882508021c0d",
        image = "gcr.io/distroless/base-debian11",
        platforms = ["linux/amd64", "linux/arm64"],
    )
    oci_pull(
        name = "distroless_base_debug",
        digest = "sha256:357bc96a42d8db2e4710d8ae6257da3a66b1243affc03932438710a53a8d1ac6",
        image = "gcr.io/distroless/base-debian11",
        platforms = ["linux/amd64", "linux/arm64"],
    )
