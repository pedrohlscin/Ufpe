waitThreads :: MVar Int -> IO ()
waitThreads fim =
    do f <- takeMVar fim
        if (f > 0) 
        then do { putMVar fim f; waitThreads fim } 
        else return ()

waitThreads :: MVar Int -> IO ()
waitThreads fim = 
    do f <- takeMVar fim
        if (f > 0) then
            do putMVar fim f
            waitThreads fim
        else 
            return ()