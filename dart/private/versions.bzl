"""Mirror of release info

TODO: generate this file from GitHub API"""

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
TOOL_VERSIONS = {
    "2.18.2": {
        "macos-x64": "sha384-0vUL6Oe3Q6whODww2wD5TK/XbIXHTCzUtdhfR+FofVirntuDvnzWu5jcjWM6jg4c",
        "macos-arm64": "sha384-3Gxm5hr/l237EFGzve5+HuSxxizyxP9Jlj1JNSG1Rwpw9Zf51OOtcu9EVMWCK6oH",
        "linux-x64": "sha384-ricpoko7girauWJciXAq6yoV1bwlwTS2HqH0/QxcICNuoUz9ygIYE9jm6k6Da3Np",
        "linux-arm": "sha384-CxEbcNTacXzuBZwoUDHqIB766hro8zXrYvgBXjHlNZQNQ7apzeqr7B88jh1Yzhp5",
        "linux-arm64": "sha384-jOcTOQZZGOc5y8XJBOobmDzRIbuHA2eeKXulS4L/2gWizqJeUsJFGbKrgtfWRf2m",
        "windows-x64": "sha384-6WBdgtQVvZidSZ14eL9hASxPDHGSbV6kyGP50znJS7lS1nf8GlrIHXd4esGOK9WL",
    },
}
