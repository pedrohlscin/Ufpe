type Semaphore = TVar Bool

newSem :: Bool -> IO Semaphore
newSem available = new TVarIO available

p:: Semaphore -> STM()
p sem - do { b <- readTVar sem;
                if b
                then writeTVar sem False
                else retry

            }

v :: Semaphore -> STM ()
v sem = writeTVar sem True