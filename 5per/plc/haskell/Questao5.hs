import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

waitThreads fim =
    do f <- takeMVar fim
    if(f > 0) then
        do putMVar fim f - 1
            waitThreads fim
    else
        return ()
    


fornecedor pao carne tomate fim = do
                                f <- takeMVar fim
                                atomically(
                                    p <- readTVar pao
                                    c <- readTVar carne
                                    t <- readTVar tomate
                                    writeTVar p 30
                                    writeTVar c 30
                                    writeTVar t 30
                                )
                                putMVar fim (f-1)
                                fornecedor pao carne tomate fim

produtor pao carne tomate faca fim = do
                                    f <- takeMVar faca
                                    fi <- takeMVar fim
                                    atomically( do
                                                    p <- readTVar pao
                                                    c <- readTVar carne
                                                    t <- readTVar tomate
                                                    writeTVar pao (p-1)
                                                    writeTVar carne (c-1)
                                                    writeTVar tomate (t-1)
                                    )
                                putMVar faca f
                                putMVar fim (fi - 1)
                                produtor pao carne tomate faca fim

main = do
        pao <- newTVar 30
        carne <- newTVar 30
        tomate <- newTVar 30
        faca <- newMVar False
        fim <- newMVar 10
        forkIO(fornecedor pao carne tomate fim)
        forkIO(produtor pao carne tomate faca fim)
        forkIO(produtor pao carne tomate faca fim)
        waitThreads fim