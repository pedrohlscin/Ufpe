import Control.Concurrent
import Control.Concurrent.MVar

waitThreads fim = do
  putMVar fim 1
  return ()

contador :: MVar Int -> MVar Int -> Int -> IO()
contador count fim 0 = do
  c <- takeMVar count
  f <- takeMVar fim
  putStrLn(show c)
contador count fim n = do
  v <- takeMVar count
  putMVar count (v + 1)
  contador count fim (n - 1)

main = do
  fim <- newMVar 1
  count <- newMVar 0
  forkIO(contador count fim 100)
  waitThreads fim
  c <- takeMVar count
  putStrLn("Saida : " ++ show c)