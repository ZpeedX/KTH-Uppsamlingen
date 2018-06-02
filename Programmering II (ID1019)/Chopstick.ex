defmodule Chopstick do
    def start do
        stick = spawn_link(fn -> available() end)
    end

    def available() do
        receive do
            {:request, from} ->
                send(from, {:ok, self()})
                gone()
            :quit -> :ok
        end
    end

    def gone() do
        receive do
            {:return, from} ->
                send(from, :ok)
                available()
            :quit -> :ok
        end
    end
    def request(left_stick, right_stick, timeout) do
        send(left_stick, {:request, self()})
        send(right_stick, {:request, self()})
        request(left_stick, right_stick, timeout, [])
    end
    def request(_,_,_, [_,_]) do :ok end
    def request(left_stick, right_stick, timeout, list) do
        receive do
            {:ok, ^left_stick} ->
            request(left_stick, right_stick, timeout, [left_stick|list])
            {:ok, ^right_stick} -> 
            request(left_stick, right_stick, timeout, [right_stick|list])
            ##after timeout ->
              ##  case list do
                ##    [id] ->
                  ##      return(id)
                    ##    send(id, {:request, self()})
                    ##_ ->
                    ##:no
                    ##end
                     ##request(left_stick, right_stick, timeout, [])
        end
       
    end

    def return(stick) do
        pid = self()
        send(stick, {:return, pid})
        receive do
            :ok -> :ok
        end
    end

    def quit(stick) do
        send(stick, :quit)
    end
end