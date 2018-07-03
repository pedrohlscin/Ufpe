import Control.Concurrent
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