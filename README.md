# Ansible Playbook: Setup macOS as developer machine [![CI][badge-gh-actions]][link-gh-actions]

Software I use as a developer.

## Setup

1. Install [Xcode via the App Store](https://apps.apple.com/us/app/xcode/id497799835) or the [Command Line Interface](https://wilsonmar.github.io/xcode/)
2. Clone this repository:
   ```shell
   git clone https://github.com/bkahlert/mac-dev-playbook
   ```
3. Create a copy of the default configuration and make it yours:
   ```shell
   cd mac-dev-playbook
   cp default.config.yml config.yml
   open config.yml
   ```
5. Set up your machine:
   ```shell
   chmod +x setup
   ./setup
   ```

## Troubleshoot

This project is a fork of [Jeff Geerling's Mac Development Ansible Playbook](https://github.com/geerlingguy/mac-dev-playbook).  
If you experience any problems, please consult the original project's documentation.

[badge-gh-actions]: https://github.com/bkahlert/mac-dev-playbook/workflows/CI/badge.svg?event=push

[link-gh-actions]: https://github.com/bkahlert/mac-dev-playbook/actions?query=workflow%3ACI

## License

MIT
