defmodule Waiter  do
    
    def start(n) do
        spawn(fn -> allow(n, 0) end)
    end

    def allow(n, n) do
        receive do
            {:return, from} ->
                send(from, :ok) 
                allow(n, n-1)

            :quit -> :ok
        end
    end
    def allow(n, c) do
        receive do
            {:request, from} ->
                send(from, :ok)
                allow(n, c+1)

            {:return, from} ->
                send(from, :ok) 
                allow(n, c-1)
            :quit -> :ok
        end
        
    end

    def request(waiter) do
        send(waiter, {:request, self()})
        receive do
            :ok -> :ok
        end
    end

    def return(waiter) do
        send(waiter, {:return, self()})
        receive do
            :ok -> :ok
        end
    end

    def quit(waiter) do
        send(waiter, :quit)
    end
end