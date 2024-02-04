# AutoLoop

## Description

AutoLoop is a custom build of DIY Loop.

## Requirements

- A relatively recent version of macOS.
- The latest version of Xcode.
- A developer account associated with Darin Krauss connected to Xcode.

## Instructions

1. Open the `Terminal` application.
1. Create and move to the directory where you want the code. For example:
    ```
    mkdir -p ~/Code/github.com/darinkrauss
    cd  ~/Code/github.com/darinkrauss
    ```
    The directory can be anything you choose.
1. Clone this repository:
    ```
    git clone https://github.com/darinkrauss/AutoLoop.git AutoLoop
    ```
1. Move to the `AutoLoop` directory:
    ```
    cd AutoLoop
    ```
1. To automatically clone the LoopWorkspace repository, make all pertitent changes to DIY Loop, and open LoopWorkspace in Xcode:
    ```
    make setup
    ```
    This step can take several minutes depending upon your network connection. If there are any failures or issues, please contact Darin Krauss.
1. Once Xcode launches, connect your phone to your computer via USB cable.
1. Unlock your phone, if it is locked.
1. If you have not connected your phone and/or watch to your computer previously:
    1. If your computer displays "Allow accessory to connect?", click "Allow".
    1. If your phone and/or watch displays "Trust this computer?", click "Trust" and enter your passcode.
1. If you have not used your phone and/or watch with Xcode previously:
    1. In Xcode, from the "Window" menu, open "Devices and Simulators".
    1. Wait for Xcode to finish preparing your phone.
    1. Close the "Devices and Simulators" window.
1. In the center-top of the Xcode window, ensure it displays "LoopWorkspace > `<phone_name>`" where `<phone_name>` is the name of your phone. For example, "Darin's Phone". If not, click on to the left and right of the ">" to change appropriately.
1. In the upper-left of the Xcode window, click the Play button (it looks like a right arrow).
1. Xcode will build AutoLoop. This may take some time.
1. Unlock your phone, if it is locked.
1. AutoLoop will launch on your phone.
1. After AutoLoop has fully launched on your phone, unplug the phone from your computer.
1. Quit Xcode.

If you find any issues or something that doesn't agree with these instructions, please contact Darin Krauss.

## History

- 2024-02-03 Initial build.

## Changes to DIY Loop

- Replace `OverrideAssetsLoop.xcassets/AppIcon.appiconset/` with custom icons.
- Replace `OverrideAssetsWatchApp.xcassets/AppIcon.appiconset/` with custom icons.
- Modify `LoopConfigOverride.xcconfig`:
    - `MAIN_APP_BUNDLE_IDENTIFIER = com.darinkrauss`
    - `MAIN_APP_DISPLAY_NAME = AutoLoop`
    - `LOOP_DEVELOPMENT_TEAM = Z4S6G3G5ZX`
