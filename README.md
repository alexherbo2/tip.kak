# tip.kak

Learn [Kakoune] from tips each day.

[Kakoune]: https://kakoune.org

## Dependencies

- [execute-key.kak]

[execute-key.kak]: https://github.com/alexherbo2/execute-key.kak

## Installation

Add [`tip.kak`](rc/tip.kak) to your autoload or source it manually.

``` kak
require-module tip
```

## Usage

Display the tip of the day with `tip-of-the-day`.
Browse tips with `tip-browse`.
Open a tip with <kbd>Enter</kbd>.

## Configuration

``` kak
# Display the tip of the day
tip-of-the-day

# Browse tips
map -docstring 'Browse tips' global normal <F2> ': tip-browse<ret>'
```
