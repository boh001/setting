# 개발 세팅

![dashboard](dashboard.png)

## [Homebrew](https://brew.sh/index_ko)

## [Iterm2](https://iterm2.com/)

- fontSize: 14
- font: [NerdFont](https://www.nerdfonts.com/)

## [Oh-my-zsh](https://ohmyz.sh/)

```bash
// .zshrc

ZSH_THEME-"bira"
```

## Tmux

### 설치
```bash
brew install tmux
```

### 설정
```conf
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

set -g mouse on

setw -g mode-keys vi

# scrollback buffer size increase
set -g history-limit 100000

# bar color
set -g status-bg black
set -g status-fg white
```

## [LazyGit](https://github.com/jesseduffield/lazygit)

### 설치

```bash
brew install lazygit

brew install diff-so-fancy
```

### 설정

```bash
// .zshrc

export GIT_EDITOR=nvim
```

### 설정

- Linux: ~/.config/lazygit/config.yml
- MacOS: ~/Library/Application Support/lazygit/config.yml
- Windows: %APPDATA%\lazygit\config.yml

```yaml

gui:
  # stuff relating to the UI
  windowSize: "normal" # one of 'normal' | 'half' | 'full' default is 'normal'
  scrollHeight: 2 # how many lines you scroll by
  scrollPastBottom: true # enable scrolling past the bottom
  sidePanelWidth: 0.2 # number from 0 to 1
  expandFocusedSidePanel: false
  mainPanelSplitMode: "flexible" # one of 'horizontal' | 'flexible' | 'vertical'
  language: "auto" # one of 'auto' | 'en' | 'zh' | 'pl' | 'nl' | 'ja' | 'ko' | 'ru'
  timeFormat: "02 Jan 06" # https://pkg.go.dev/time#Time.Format
  shortTimeFormat: "3:04PM"
  theme:
    activeBorderColor:
      - green
      - bold
    inactiveBorderColor:
      - white
    searchingActiveBorderColor:
      - cyan
      - bold
    optionsTextColor:
      - blue
    selectedLineBgColor:
      - blue # set to `default` to have no background colour
    selectedRangeBgColor:
      - blue
    cherryPickedCommitBgColor:
      - cyan
    cherryPickedCommitFgColor:
      - blue
    unstagedChangesColor:
      - red
    defaultFgColor:
      - default
  commitLength:
    show: true
  mouseEvents: true
  skipDiscardChangeWarning: false
  skipStashWarning: false
  showFileTree: true # for rendering changes files in a tree format
  showListFooter: true # for seeing the '5 of 20' message in list panels
  showRandomTip: true
  showBranchCommitHash: false # show commit hashes alongside branch names
  experimentalShowBranchHeads: false # visualize branch heads with (*) in commits list
  showBottomLine: true # for hiding the bottom information line (unless it has important information to tell you)
  showCommandLog: true
  showIcons: false # deprecated: use nerdFontsVersion instead
  nerdFontsVersion: "" # nerd fonts version to use ("2" or "3"); empty means don't show nerd font icons
  commandLogSize: 8
  splitDiff: "auto" # one of 'auto' | 'always'
  skipRewordInEditorWarning: false # for skipping the confirmation before launching the reword editor
  border: "single" # one of 'single' | 'double' | 'rounded' | 'hidden'
git:
  paging:
    colorArg: always
    pager: diff-so-fancy
  merging:
    # only applicable to unix users
    manualCommit: false
    # extra args passed to `git merge`, e.g. --no-ff
    args: ""
  log:
    # one of date-order, author-date-order, topo-order or default.
    # topo-order makes it easier to read the git log graph, but commits may not
    # appear chronologically. See https://git-scm.com/docs/git-log#_commit_ordering
    order: "topo-order"
    # one of always, never, when-maximised
    # this determines whether the git graph is rendered in the commits panel
    showGraph: "when-maximised"
    # displays the whole git graph by default in the commits panel (equivalent to passing the `--all` argument to `git log`)
    showWholeGraph: true
  skipHookPrefix: WIP
  # The main branches. We colour commits green if they belong to one of these branches,
  # so that you can easily see which commits are unique to your branch (coloured in yellow)
  mainBranches: [master, main]
  autoFetch: true
  autoRefresh: true
  fetchAll: true # Pass --all flag when running git fetch. Set to false to fetch only origin (or the current branch's upstream remote if there is one)
  branchLogCmd: "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit {{branchName}} --"
  allBranchesLogCmd: "git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  overrideGpg: false # prevents lazygit from spawning a separate process when using GPG
  disableForcePushing: false
  parseEmoji: false
  diffContextSize: 3 # how many lines of context are shown around a change in diffs
os:
  editPreset: "" # see 'Configuring File Editing' section
  edit: ""
  editAtLine: ""
  editAtLineAndWait: ""
  open: ""
  openLink: ""
refresher:
  refreshInterval: 10 # File/submodule refresh interval in seconds. Auto-refresh can be disabled via option 'git.autoRefresh'.
  fetchInterval: 60 # Re-fetch interval in seconds. Auto-fetch can be disabled via option 'git.autoFetch'.
update:
  method: prompt # can be: prompt | background | never
  days: 14 # how often an update is checked for
confirmOnQuit: false
# determines whether hitting 'esc' will quit the application when there is nothing to cancel/close
quitOnTopLevelReturn: false
disableStartupPopups: false
notARepository: "prompt" # one of: 'prompt' | 'create' | 'skip' | 'quit'
promptToReturnFromSubprocess: true # display confirmation when subprocess terminates
keybinding:
  universal:
    quit: "q"
    quit-alt1: "<c-c>" # alternative/alias of quit
    return: "<esc>" # return to previous menu, will quit if there's nowhere to return
    quitWithoutChangingDirectory: "Q"
    togglePanel: "<tab>" # goto the next panel
    prevItem: "<up>" # go one line up
    nextItem: "<down>" # go one line down
    prevItem-alt: "k" # go one line up
    nextItem-alt: "j" # go one line down
    prevPage: "," # go to next page in list
    nextPage: "." # go to previous page in list
    gotoTop: "<" # go to top of list
    gotoBottom: ">" # go to bottom of list
    scrollLeft: "H" # scroll left within list view
    scrollRight: "L" # scroll right within list view
    prevBlock: "<left>" # goto the previous block / panel
    nextBlock: "<right>" # goto the next block / panel
    prevBlock-alt: "h" # goto the previous block / panel
    nextBlock-alt: "l" # goto the next block / panel
    jumpToBlock: ["1", "2", "3", "4", "5"] # goto the Nth block / panel
    nextMatch: "n"
    prevMatch: "N"
    optionMenu: null # show help menu
    optionMenu-alt1: "?" # show help menu
    select: "<space>"
    goInto: "<enter>"
    openRecentRepos: "<c-r>"
    confirm: "<enter>"
    remove: "d"
    new: "n"
    edit: "e"
    openFile: "o"
    scrollUpMain: "<pgup>" # main panel scroll up
    scrollDownMain: "<pgdown>" # main panel scroll down
    scrollUpMain-alt1: "K" # main panel scroll up
    scrollDownMain-alt1: "J" # main panel scroll down
    scrollUpMain-alt2: "<c-p>" # main panel scroll up
    scrollDownMain-alt2: "<c-n>" # main panel scroll down
    executeCustomCommand: ":"
    createRebaseOptionsMenu: "m"
    pushFiles: "P"
    pullFiles: "p"
    refresh: "R"
    createPatchOptionsMenu: "<c-p>"
    nextTab: "]"
    prevTab: "["
    nextScreenMode: "+"
    prevScreenMode: "_"
    undo: "z"
    redo: "<c-z>"
    filteringMenu: "<c-s>"
    diffingMenu: "W"
    diffingMenu-alt: "<c-e>" # deprecated
    copyToClipboard: "<c-o>"
    submitEditorText: "<enter>"
    extrasMenu: "@"
    toggleWhitespaceInDiffView: "<c-w>"
    increaseContextInDiffView: "}"
    decreaseContextInDiffView: "{"
  status:
    checkForUpdate: "u"
    recentRepos: "<enter>"
  files:
    commitChanges: "c"
    commitChangesWithoutHook: "w" # commit changes without pre-commit hook
    amendLastCommit: "A"
    commitChangesWithEditor: "C"
    ignoreFile: "i"
    refreshFiles: "r"
    stashAllChanges: "s"
    viewStashOptions: "S"
    toggleStagedAll: "a" # stage/unstage all
    viewResetOptions: "D"
    fetch: "f"
    toggleTreeView: "`"
    openMergeTool: "M"
    openStatusFilter: "<c-b>"
  branches:
    createPullRequest: "o"
    viewPullRequestOptions: "O"
    checkoutBranchByName: "c"
    forceCheckoutBranch: "F"
    rebaseBranch: "r"
    renameBranch: "R"
    mergeIntoCurrentBranch: "M"
    viewGitFlowOptions: "i"
    fastForward: "f" # fast-forward this branch from its upstream
    createTag: "T"
    pushTag: "P"
    setUpstream: "u" # set as upstream of checked-out branch
    fetchRemote: "f"
  commits:
    squashDown: "s"
    renameCommit: "r"
    renameCommitWithEditor: "R"
    viewResetOptions: "g"
    markCommitAsFixup: "f"
    createFixupCommit: "F" # create fixup commit for this commit
    squashAboveCommits: "S"
    moveDownCommit: "<c-j>" # move commit down one
    moveUpCommit: "<c-k>" # move commit up one
    amendToCommit: "A"
    pickCommit: "p" # pick commit (when mid-rebase)
    revertCommit: "t"
    cherryPickCopy: "c"
    cherryPickCopyRange: "C"
    pasteCommits: "v"
    tagCommit: "T"
    checkoutCommit: "<space>"
    resetCherryPick: "<c-R>"
    copyCommitMessageToClipboard: "<c-y>"
    openLogMenu: "<c-l>"
    viewBisectOptions: "b"
  stash:
    popStash: "g"
    renameStash: "r"
  commitFiles:
    checkoutCommitFile: "c"
  main:
    toggleDragSelect: "v"
    toggleDragSelect-alt: "V"
    toggleSelectHunk: "a"
    pickBothHunks: "b"
  submodules:
    init: "i"
    update: "u"
    bulkMenu: "b"
```

## Nvim

### 설치

```bash
brew install nvim
```

### [Workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)

```bash
// 프로젝트 디렉토리 추가
:WorkspacesAddDir [path]

// 프로젝트 디렉토리 삭
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

```bash
// .zshrc

eval "$(fnm env --use-on-cd)"
```

## TODO

- 개발하면서 추가 예정
