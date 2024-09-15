# ttcraft

## Description
ttcraft is a Minecraft™-inspired game designed to be played with a Tiptoi™ pen. Initially, the game was a treasure hunt through the city, but it is now evolving into a board game-like experience. The project makes use of `tttool` and Velocity templates for generating the necessary game artifacts.

## Quirks and Features

### Bash Script-Based Build
The game build is initiated through the `build.sh` script, which compiles all the necessary artifacts into a `.gme` file. This script automates the build process to ensure all components are prepared for gameplay.

### Velocity Templating and Context
Velocity is used to simplify working with the limitations of YAML. While some may consider Velocity outdated, it is feature-complete for this project. The build requires `vtl-cli.jar` to process the templates.

Due to the `$` symbol marking variables in Velocity, parsing can be challenging. Currently, variables related to Velocity are prefixed with `v_` to avoid conflicts. I’m considering adopting a more structured approach, with prefixes like `v_` for Velocity variables, `c_` for context variables, and `t_` for YAML-level variables, and may transition the code accordingly.

### `audio_script.vm` and macOS "say"
The project generates audio snippets using the macOS built-in text-to-speech engine (`say`), which produces slightly more natural-sounding audio for my needs. This can be easily modified to use another text-to-speech engine if necessary.

### Swiss Supermarket Promotional Tiptoi Stickers
At one point, a Swiss supermarket ran a promotion where customers could collect stickers for a Tiptoi book. I use these promotional stickers in my projects to avoid the hassle of printing custom ones. This explains the MCode translations in the script code section. If you print your own maps, this should have no impact.

# Links

TBD

# TODO

- improve readme
- put variable names in proper namespaces (c_, v_, t_)
- randomize goal
- refactor random2 / reset and selecting current item
