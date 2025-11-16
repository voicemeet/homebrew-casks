# Homebrew Casks

[![Test](https://github.com/voicemeet/homebrew-casks/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/voicemeet/homebrew-casks/actions/workflows/test.yml)
[![Excavator](https://github.com/voicemeet/homebrew-casks/actions/workflows/excavator.yml/badge.svg)](https://github.com/voicemeet/homebrew-casks/actions/workflows/excavator.yml)

## Casks

<table>
  <tr>
    <th>Casks</th>
    <th>Version</th>
  </tr>
  <tr>
    <td>voicemeet</td>
    <td>
      <img alt="Homebrew Cask Version" src="https://img.shields.io/badge/dynamic/json.svg?url=https://raw.githubusercontent.com/voicemeet/homebrew-casks/main/Info/voicemeet.json&query=$.casks.[0].version&label=homebrew">
    </td>
  </tr>
</table>

## Install

`brew install voicemeet/casks/<cask>`

Or `brew tap voicemeet/casks` and then `brew install <cask>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "voicemeet/casks"
brew "<cask>"
```

## Debug

`brew audit --strict --fix --cask <cask>`

`brew livecheck --debug <cask>`

## Documentation

Your taps are Git repositories located at `$(brew --repository)/Library/Taps`

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
