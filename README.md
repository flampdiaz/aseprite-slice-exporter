# Aseprite Slice Exporter

An Aseprite extension that exports each slice as an individual PNG file using the slice name.

This tool is designed for artists and developers who work with slices (UI elements, tiles, icons, shapes) and want a simple, open, script-based way to export them without using the Aseprite CLI.

---

## Features

- Exports one PNG per slice
- Uses the slice name as the filename
- Preserves slice bounds exactly
- No empty or duplicated images
- Does not rely on the Aseprite CLI
- Integrated directly into the Aseprite File menu

---

## Installation

1. Go to the **Releases** page:  
   👉 [https://github.com/flampdiaz/aseprite-slice-exporter/releases](https://github.com/flampdiaz/aseprite-slice-exporter/releases)
2. Download the latest file:  
   **aseprite-slice-exporter-vX.Y.Z.zip**
3. Open Aseprite and go to:  
   **Edit → Preferences → Extensions**
4. Click **Add Extension** and select the downloaded ZIP file
5. Restart Aseprite if prompted

### Updating

To update the extension, download the newest release ZIP and repeat the same installation steps above.  
Updates are installed manually.

---

## Usage

1. Open a sprite that contains slices
2. Go to `File → Export Slices as PNGs…`
3. Select any file inside the folder where you want the PNGs exported
4. Click **Export**

Each slice will be exported as an individual PNG.

---

## How It Works

The extension renders the active sprite frame into memory, crops each slice using its bounds, and saves each slice as an individual PNG file using the slice name.

All visible layers are flattened exactly as they appear on the canvas. Only the currently active frame is used during export.

Because some Aseprite builds do not provide a native folder picker for scripts, the export dialog asks you to select **any file inside the target folder**. The extension automatically detects the folder and exports the PNG files directly into it.

---

## What This Tool Is For

Use this extension when you have multiple assets in a single canvas (icons, tiles, UI pieces, shapes, etc.), and you want to export each asset as a separate PNG using slices.

This is ideal for workflows where you want standalone PNG files instead of a spritesheet.

---

## What It Does Not Do

To avoid confusion:

- It does **not** generate spritesheets
- It does **not** export animations
- It does **not** export every frame automatically
- It does **not** export layers as separate files

If you need spritesheets or animation exports, Aseprite’s built-in exporters are a better fit.

---

## Tested Scenario

Tested with a single canvas containing multiple distinct assets, each marked with a named slice. For example, a slice named `Triangle_Outline` is exported as `Triangle_Outline.png` (one PNG per slice).

---

## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.

You are free to use, study, and modify this extension.

- Any modified or redistributed version **must remain open source** and licensed under GPLv3.
- Proper **credit to the original author must be preserved**.
- Improvements and changes must be shared publicly under the same license.

Using this extension as a tool does **not** require your own projects (games, assets, pipelines) to be open source.

## Support

My work is open-source and developed in my free time.

If this extension helps you, your support goes beyond this project. It helps me continue creating games and tools that empower other developers to build their own games and products across different engines and technologies, such as Aseprite, Unity, Godot, Unreal Engine, raylib, and more.

Your support also allows me to dedicate more time to building open, useful, long-term projects for the game development community.

- ☕ [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-support-yellow)](https://buymeacoffee.com/flampdiaz.dev)

Thank you for supporting independent open-source development ❤️