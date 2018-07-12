import Control.Concurrent
<<<<<<< HEAD
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
=======
import Control.Concurrent.STM
import Control.Concurrent.MVar

waitThreads fim = 
    do f <- takeMVar fim
       if (f > 0) then
           do putMVar fim f
              waitThreads fim
       else 
           return ()

counter :: MVar Int -> MVar Int -> IO()
counter var fim = do
    f <- takeMVar fim
    v <- takeMVar var
    putMVar fim (f - 1)
    putMVar var (v + 1)
    counter var fim

main = do
    fim <- newMVar 100
    contador <- newMVar 0
    forkIO(counter contador fim)
    waitThreads fim
    c <- takeMVar contador
    putStrLn("Hello")
>>>>>>> bbb7877f094a2c404d3d5c0a20b1896e93ea0f5f
