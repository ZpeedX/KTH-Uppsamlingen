defmodule Dinner do

    def start() do 
        dinner = spawn_link(fn -> init(1234, 5) end) 
        Process.register(dinner, :dinner)
    end

    def stop, do: send(:dinner, :abort)

    def init(seed, n) do
        c1 = Chopstick.start()
        c2 = Chopstick.start()
        c3 = Chopstick.start()
        c4 = Chopstick.start()
        c5 = Chopstick.start()
        waiter = Waiter.start(4)
        ctrl = self()
        Philosopher.start(n, c1, c2, "Arendt", ctrl, seed + 1, waiter)
        Philosopher.start(n, c2, c3, "Hypatia", ctrl, seed + 2, waiter)
        Philosopher.start(n, c3, c4, "Simone", ctrl, seed + 3, waiter)
        Philosopher.start(n, c4, c5, "Elisabeth", ctrl, seed + 4, waiter)
        Philosopher.start(n, c5, c1, "Ayn", ctrl, seed + 5, waiter)      ## blir ingen deadlock om c5 och c1 byter plats
        wait(5, [c1, c2, c3, c4, c5], waiter)
    end

    def wait(0, chopsticks, waiter) do
        Enum.each(chopsticks, fn(c) -> Chopstick.quit(c) end)
    end
    def wait(n, chopsticks, waiter) do
        receive do
            :done ->
                wait(n - 1, chopsticks, waiter)
            :abort ->
                Process.exit(self(), :kill)
        end
        Waiter.quit(waiter)
    end
end