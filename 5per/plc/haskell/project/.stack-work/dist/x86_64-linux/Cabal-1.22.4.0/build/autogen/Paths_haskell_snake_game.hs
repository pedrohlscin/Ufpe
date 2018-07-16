module Paths_haskell_snake_game (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/media/p/Data/Repositories/Ufpe/5per/plc/haskell/project/.stack-work/install/x86_64-linux/lts-3.5/7.10.2/bin"
libdir     = "/media/p/Data/Repositories/Ufpe/5per/plc/haskell/project/.stack-work/install/x86_64-linux/lts-3.5/7.10.2/lib/x86_64-linux-ghc-7.10.2/haskell-snake-game-0.1.0-CvD1J8tukoCH9CN6zLuWnH"
datadir    = "/media/p/Data/Repositories/Ufpe/5per/plc/haskell/project/.stack-work/install/x86_64-linux/lts-3.5/7.10.2/share/x86_64-linux-ghc-7.10.2/haskell-snake-game-0.1.0"
libexecdir = "/media/p/Data/Repositories/Ufpe/5per/plc/haskell/project/.stack-work/install/x86_64-linux/lts-3.5/7.10.2/libexec"
sysconfdir = "/media/p/Data/Repositories/Ufpe/5per/plc/haskell/project/.stack-work/install/x86_64-linux/lts-3.5/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_snake_game_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_snake_game_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_snake_game_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_snake_game_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_snake_game_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
