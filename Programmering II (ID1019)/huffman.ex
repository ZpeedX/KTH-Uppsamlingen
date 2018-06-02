defmodule Huffman do
    
    def sample do
        "the quick brown fox jumps over the lazy dog
        this is a sample text that we will use when we build
        up a table we will only handle lower case letters and
        no punctuation symbols the frequency will of course not
        represent english but it is probably not that far off"
    end

    def test(n) do
    sample = read("kallocain.txt", n)
    tree = tree(sample)
     encode = encode_table(tree)
     seq = encode(sample, encode)
     decode_w_tree(seq, tree, tree)
    end

    def tree(sample) do
        freq = msort(freq(sample))
        huffman(freq)
    end
    
    def encode_table(tree) do
        encode_table(tree, [], [])
    end

    def encode_table({{l,r},_}, cl, list) do
        left = encode_table(l, [0|cl], list)
        encode_table(r, [1|cl], left)

    end
    def encode_table({x,r}, cl, list) do
        insert({x, Enum.reverse(cl), r},list)
    end

    def decode_table(tree) do
    end

    def encode([],_) do [] end    
    def encode([c|t], table) do
        findChar(c, table) ++ encode(t, table)
    end

    
    def findChar(c, xs) do
        case xs do
            [{h, l,_}|t] when h == c ->
                l
            [h|t] ->
                findChar(c, t)
            [] ->
                []
        end
    end

    def decode([], _) do [] end 

    def decode(seq, table) do
         {char, rest} = decode_char(seq, 1, table)
        [char | decode(rest, table)]
    end
    def decode_char(seq, n, table) do
        {code, rest} = Enum.split(seq, n)
        case List.keyfind(table, code, 1) do
            {c,_,_} ->
               {c,rest}
            nil ->
               decode_char(seq, n+1, table)
        end
    end

    def decode_w_tree([],_,_)  do [] end
    def decode_w_tree([b|seq], {{l,r}, _}, tree) do
            case b do
                0 ->
                    decode_w_tree(seq, l, tree)
                1 ->
                    decode_w_tree(seq, r, tree)
            end
    end

    def decode_w_tree(seq, {char, freq}, tree) do
        [char|decode_w_tree(seq, tree, tree)]
    end
        


    def freq(sample) do
        freq(sample, [])
    end

    def freq([], freq) do
        freq                  
    end

    def freq([char|rest], freq) do
        freq(rest, freqAdd(char, freq))
    end

    def freqAdd(char, freq) do
        case freq do
            [] ->
                [{char, 1}]
            [{f,n}|t] when f == char ->
                [{f, n+1}| t]
            [h|t] ->
                [h|freqAdd(char, t)]
        end
    end


    def huffman ([x]) do x end

    def huffman([{x,h1},{y,h2}|t]) do
        nList = insert({{{x,h1},{y,h2}}, h1+h2}, t)
        huffman(nList)     
    end
    def insert(x, []) do [x] end
    def insert({h, y}, [{h1, x}|xs]) do
        if x < y do
            [{h1, x}|insert({h, y}, xs)]
        else 
            [{h, y}, {h1, x}| xs]
        end
    end

    def insert({h,blist, y}, [{h1,nlist, x}|xs]) do
        if x > y do
            [{h1,nlist, x}|insert({h,blist, y}, xs)]
        else
            [{h,blist, y}, {h1,nlist, x}| xs]
        end
    end

    def msort(l) do
        case l do
            [x] -> 
                [x]
            [h|t] ->
                {l1, l2} = msplit(l, [], [])
                merge(msort(l1), msort(l2))
        end
    end

    def merge([],x) do x end
    def merge(x, []) do x end
    def merge([{x,h}|t], [{x1,h1}|t1]) do
        if h < h1 do
            [{x,h}|merge(t, [{x1,h1}|t1])]
        else
            [{x1,h1}|merge([{x,h}|t], t1)]
        end
    end

    def msplit(l, xs, ys) do
        case l do
            [h,x|t] -> 
                msplit(t, [h|xs], [x|ys])
            [h] ->
                {xs, [h|ys]}
            [] ->
                {xs, ys}
        end
    end


    def read(file, n) do
        {:ok, file} = File.open(file, [:read])
        binary = IO.read(file, n)
        File.close(file)
        case :unicode.characters_to_list(binary, :utf8) do
            {:incomplete, list, _} ->
                list;
            list ->
                list
        end
    end
  def bench_huffman() do
        ls = [10, 1000, 100000, 1000000, 1000000000]
        n = 10
        bench = fn(l) ->
            t = time(n, fn() -> test(l) end)
            :io.format("n: ~10w test(n) calculated in: ~8w us~n", [l, t])
        end
        Enum.each(ls, bench)
    end

    def time(n, fun) do
        start = System.monotonic_time(:milliseconds)
        loop(n, fun)
        stop = System.monotonic_time(:milliseconds)
        stop - start
    end
    def loop(n, fun) do
        if n == 0 do
            :ok
        else
            fun.()
            loop(n - 1, fun)
        end
    end
end


  