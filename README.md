# Setting

## Mac

### [Iterm2](https://iterm2.com/)
- fontSize: 14
- font: [NerdFont](https://www.nerdfonts.com/)
- colorscheme: [tokyonight-storm](https://iterm2colorschemes.com/)

### [Oh-my-zsh](https://ohmyz.sh/)

## [Homebrew](https://brew.sh/index_ko)

## Tmux

### 설치
```bash
brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## [LazyGit](https://github.com/jesseduffield/lazygit)

### 설치

```bash
brew install lazygit

brew install diff-so-fancy
```
### 설정파일위치
- Linux: ~/.config/lazygit/config.yml
- MacOS: ~/Library/Application Support/lazygit/config.yml
- Windows: %APPDATA%\lazygit\config.yml


## Nvim

### 설치

```bash
brew install nvim
```

### [Workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)

```bash
// 프로젝트 디렉토리 추가
:WorkspacesAddDir [path]

// 프로젝트 디렉토리 삭제
:WorkspacesRemoveDir [name]
```

### [LSP](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- tsserver

```bash
npm install -g typescript typescript-language-server
```

- eslint

```bash
npm i -g vscode-langservers-extracted
```

## Fnm

### 설치

```bash
brew install fnm
```

## TODO

- 개발하면서 추가 예정
