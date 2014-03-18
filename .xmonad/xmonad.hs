import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import System.IO

main = do
    xmproc <- spawnPipe "~/.cabal/bin/xmobar ~/.xmonad/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        , startupHook = spawnOnce "~/.xmonad/switch_layout.sh"
        , modMask = mod4Mask
        , focusedBorderColor = "orange"
        }
        `additionalKeysP`
        [ ("<XF86AudioLowerVolume>", spawn "amixer -c 0 set Master 2dB-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer -c 0 set Master 2dB+")
        ]
