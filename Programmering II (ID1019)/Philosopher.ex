defmodule Philosopher do
    
    def start(hunger, right, left, name, ctrl, seed, waiter) do
        spawn_link(fn ->
            run(hunger, right, left, name, ctrl, seed, waiter)
        end)
    end

    def run(0,_,_,name,ctrl,_, _) do 
    send(ctrl, :done)
     IO.puts("*#{name} is done eating!")
     end 
    def run(hunger, left, right, name, ctrl, seed, waiter) do
        timeout = 5000
        sleep(seed)
        Waiter.request(waiter)
        Chopstick.request(left, right, timeout)
        ##IO.puts("#{name} received the left chopstick!")
        ##Chopstick.request(right, timeout)
        ##IO.puts("#{name} received the right chopstick!")
        IO.puts("#{name} has taken both chopsticks!")
        sleep(seed)
        Chopstick.return(left)
        Chopstick.return(right)
        Waiter.return(waiter)
        IO.puts("#{name} is done with the chopsticks!")
        run(hunger-1, left, right, name, ctrl, seed, waiter)
    end


    def sleep(t) do
        :timer.sleep(:rand.uniform(t))
    end
end