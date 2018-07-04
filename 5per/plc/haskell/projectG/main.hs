--instaled 
-- threepenny-gui
-- gtk2hs-buildtools
-- libghc-gtk-dev
-- libcanberra-gtk-module libcanberra-gtk3-module

import Graphics.UI.Gtk
import Control.Monad.Trans(liftIO)

-- main :: IO ()
main = do
  initGUI
  window <- windowNew
  set window[windowTitle := "Hello box",
             windowDefaultWidth := 600, windowDefaultHeight := 600,
             containerBorderWidth := 30 ]
  window `on` deleteEvent $ do
    liftIO (putStrLn "Closing")
    liftIO mainQuit
    return False

  window `on` configureEvent $ do
    (width, height) <- eventSize
    liftIO (putStrLn (show width ++ " x " ++ show height))
    return False
   

  widgetShowAll window
  mainGUI