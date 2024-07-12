[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/S6S310DONO)
# FiveM Model Blacklist Script

## Description

This FiveM script allows server administrators to blacklist specific vehicles, peds, and weapons, preventing players from using them. It includes configurable options such as custom messages for restricted items and ACE permissions for bypassing the blacklist.

## Features

- **Vehicle Blacklist:** Restrict specific vehicles from being used.
- **Ped Blacklist:** Restrict specific peds from being used.
- **Weapon Blacklist:** Restrict specific weapons from being used.
- **Custom Messages:** Display custom messages when restricted items are used.
- **ACE Permissions Bypass:** Allow certain players to bypass the blacklist restrictions using ACE permissions.

## Configuration

The configuration options are available in the `Config` table within the script.

### General Settings

- `VehicleBlacklist`: Enable or disable vehicle blacklist (default: `true`).
- `PedBlacklist`: Enable or disable ped blacklist (default: `true`).
- `WeaponBlacklist`: Enable or disable weapon blacklist (default: `true`).

### Custom Messages

- `VehBlacklistMessage`: Message displayed when a restricted vehicle is deleted.
- `PedBlacklistMessage`: Message displayed when a restricted ped is deleted.
- `WepBlacklistMessage`: Message displayed when a restricted weapon is deleted.

### Default Ped

- `DefaultPed`: The default ped model to use (default: `a_m_y_yoga_01`).

### Bypass Settings

- `Bypass`: Enable or disable ACE permissions bypass (default: `true`).
- `VehBypass`: ACE permission string for vehicle bypass (default: `AJ:VehBypass`).
- `PedBypass`: ACE permission string for ped bypass (default: `AJ:PedBypass`).
- `WepBypass`: ACE permission string for weapon bypass (default: `AJ:WepBypass`).

### Blacklists

- `VehBlacklist`: List of blacklisted vehicles.
- `PedBlacklist`: List of blacklisted peds.
- `WepBlacklist`: List of blacklisted weapons.

## How to Use

1. **Add the script to your FiveM server:**
   - Drag `AJ_ModelBlacklist` to your server's resources folder.

2. **Edit your server configuration:**
   - Add `start AJ_ModelBlacklist` to your server configuration file (`server.cfg`).

3. **Configure ACE permissions (if bypass is enabled):**
   - Add the ACE permissions for your desired group in your server configuration:
     ```
     add_ace group.[GROUP_NAME] AJ.VehBypass allow
     add_ace group.[GROUP_NAME] AJ.PedBypass allow
     add_ace group.[GROUP_NAME] AJ.WepBypass allow
     ```

4. **Customize the blacklist:**
   - Edit the `Config` table within the script to add or remove items from the blacklists.

5. **Start your server:**
   - Restart your FiveM server or start it if it’s not already running.
