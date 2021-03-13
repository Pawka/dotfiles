# Bazel completion plugin for Zsh (oh-my-zsh)

A copy of the zsh completion script from the official
[bazel](https://raw.githubusercontent.com/bazelbuild/bazel/64d9a4d6dcd720a3b7a60ff550a17a7707dd41d0/scripts/zsh_completion/_bazel)
repo.

## Setup (with oh-my-zsh)

1. Setup your [oh-my-zsh](https://ohmyz.sh) with [*customization*](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).
2. Clone this repo to `plugins` directory of your oh-my-zsh *customization*.
    ```
    git clone https://github.com/jackwish/bazel $ZSH_CUSTOM/plugins/bazel
    ```
3. Put `bazel` in your plugin list of `.zshrc`. Example:
    ```
    plugins=(
      ...
      bazel
      ...
    )
    ```
4. Reload your zsh and navigate to a bazel build based project to verify. (It may take several seconds to load project-wise bazel configuration when you typing `tab` in bazel command at the first time.)


You can also setup bazel completion for zsh manually with the guide of
[official document](https://docs.bazel.build/versions/master/completion.html#zsh).
Note that, you need to put the `fpath` setup of the document in your `.zshrc`.
[This issue](https://github.com/bazelbuild/bazel/issues/4255) may help if you encouner something.


## Why another repo?

There is a [ongoing PR](https://github.com/robbyrussell/oh-my-zsh/pull/6434)
for oh-my-zsh by some other contributor, which intergates bazel into official plugin set.
However the reviewing process seems stuck.


## Related Projects

* [Oh my zsh](https://ohmyz.sh)
* [perf (linux) completion plugin for Zsh](https://github.com/jackwish/perf)

## License

Apache License 2.0 as the original tool.
