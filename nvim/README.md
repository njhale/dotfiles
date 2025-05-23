# 💤 LazyVim Configuration

This is a customized configuration for [LazyVim](https://github.com/LazyVim/LazyVim), tailored to enhance the Neovim experience with a focus on specific languages and tools.

## Configuration Overview

- **LazyVim**: Utilizes LazyVim as the base configuration, which provides a solid foundation for Neovim setups.
- **Plugin Management**: Managed using `lazy.nvim`, ensuring efficient loading and management of plugins.
- **Language Support**: Includes additional language support for Go, Rust, Python, TypeScript, Vue, Markdown, YAML, JSON, and TOML.
- **Custom Plugins**: Integrates custom plugins like `avante.nvim` for enhanced functionality.
- **Disabled Plugins**: Some plugins like `bufferline.nvim` and `mini.pairs` are disabled to streamline the setup.

## Key Features

- **Auto Commands**: Custom auto commands are set up to disable autoformatting for TypeScript files.
- **File Type Detection**: Custom file type detection for `.gpt` files as YAML.
- **Options**: Specific options are set, such as disabling swap files and setting tabline visibility.

## Installation

Refer to the [LazyVim documentation](https://lazyvim.github.io/installation) for initial setup instructions. After setting up LazyVim, clone this configuration into your Neovim configuration directory and start Neovim.

```bash
git clone <your-repo-url> ~/.config/nvim
nvim
