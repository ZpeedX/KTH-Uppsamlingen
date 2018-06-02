defmodule Env do
    def new() do
       [] 
    end

    def add(id, str, env) do
        [{id,str}|env]
    end

    def lookup(id, env) do
        case env do
            [] ->
                nil
            [{^id, str}|t] -> 
                {id,str}
            [h|t] ->
                lookup(id, t)
        end
    end

    def remove(ids, env) do
        case ids do
            [] ->
                env
            [id|t] ->
                remove(t, rem_(id, env))
        end
    end
    
    def rem_(id, [])  do [] end
    def rem_(id, [{id, _}|t]) do
        t
    end
    def rem_(id, [h|t]) do
        [h|rem_(id, t)]
    end
    def closure(_, []) do :error end
    def closure([], _) do [] end
    def closure([id|t], env) do
        case Env.lookup(id, env) do
            nil ->
                :error
            str ->
                [str| closure(t, env)]
        end
    end

    def args([], [], env) do env end
    def args([var|par], [str| args], env) do
        args(par, args, add(var, str, env))
    end
    def args(_, _,_) do :error end
end

defmodule Eager do
    def eval_expr({:atm,id}, _, _) do {:ok, id} end
    def eval_expr({:var, id}, env, _) do
        case Env.lookup(id, env) do
            nil ->
                :error
            {_, str} ->
                {:ok, str}
        end
    end
    def eval_expr({:cons, head, tail}, env, prg) do
        case eval_expr(head, env, prg) do
            :error ->
                :error
            {:ok, id} ->
                case eval_expr(tail, env, prg) do
                    :error -> 
                        :error
                    {:ok, ts} ->
                        {:ok, [id|ts]}
                end
        end
    end

    def eval_expr({:case, expr, cls},  env, prg) do

        case eval_expr(expr, env, prg) do
            :error ->
                :error
            {:ok, str} ->
                eval_cls(cls, str, env, prg)
        end
    end

    def eval_expr({:lambda, par, free, seq}, env, _) do
        case Env.closure(free, env) do
            :error ->
                :error
            closure ->
                {:ok, {:closure, par, seq, closure}}
        end
    end

    def eval_expr({:apply, expr, args}, env, prg) do
        case eval_expr(expr, env, args) do
            :error ->
                :error
            {:ok, {:closure, par, seq, closure}} ->
                case eval_args(args, env, prg) do
                    :error ->
                        :error
                    strs ->
                        env = Env.args(par, strs, closure)
                        eval_seq(seq, env, prg)
                end
        end
    end

    def eval_expr({:call, id, args}, env, prg) when is_atom(id) do
        case List.keyfind(prg, id, 0) do
            nil ->
                :error
            {_, par, seq} ->
                case eval_args(args,env, prg) do
                    :error ->
                    
                        :error
                    strs ->
                        env= Env.args(par,strs, [])
                        eval_seq(seq,env,prg)
                end
        end

    end

    def eval_args([], _, _) do [] end
    def eval_args([atm|t], env, prg) do
        case eval_expr(atm, env, prg) do
            :error ->
                :error
            {:ok, str} ->
                [str|eval_args(t, env, prg)]
        end
    end

    def eval_cls([], _,_, _) do  :error end
    def eval_cls([{:clause, ptr, seq}| cls], str, env, prg) do

        case eval_match(ptr,str, env) do
            :fail ->
                eval_cls(cls,str,env, prg)
            {:ok, env} ->
                eval_seq(seq,env, prg)
        end
    end

    def eval_match(:ignore, _, env) do {:ok, env} end
    def eval_match({:atm, id}, id, env) do {:ok, env} end
    def eval_match({:var, id}, str, env) do
        case Env.lookup(id, env) do
            nil -> 
                {:ok, Env.add(id, str, env)}
            {_, ^str} ->
                {:ok, env}
            {_, _} ->
                :fail
        end
    end
    def eval_match({:cons, hp, tp}, [hs|ts], env) do
        case eval_match(hp, hs, env) do
            :fail ->
                :fail
            {:ok, env1} ->
                eval_match(tp, ts, env1)
        end
    end
    def eval_match(_, _, _) do
        :fail
    end

    def eval(seq) do 
        eval_seq(seq, Env.new(), [])
    end

    def eval_seq([exp], env, prg) do
        eval_expr(exp, env, prg)
    end

    def eval_seq([{:match, patr, td}| t], env, prg) do
        case eval_expr(td, env, prg) do
            :error ->
                :error
            {:ok, str} ->
                vars = extract_vars(patr)
                env = Env.remove(vars, env)        
            case eval_match(patr, str,env) do
                :fail ->
                    :error
                {:ok, env} ->
                    eval_seq(t, env, prg)
            end
        end
    end


    def extract_vars(:ignore) do [] end
    def extract_vars({:var, id}) do
        [id]
    end
    def extract_vars({:cons, ts, td}) do
        extract_vars(ts) ++ extract_vars(td)
    end

    def pgrm do
 [{:append, [:x, :y],
[{:case, {:var, :x},
[{:clause, {:atm, []}, [{:var, :y}]},
{:clause, {:cons, {:var, :hd}, {:var, :tl}},
[{:cons,
{:var, :hd},
{:call, :append, [{:var, :tl}, {:var, :y}]}}]
}]
}]
}]


    end

    def seq do
        [{:match, {:var, :x},
{:cons, {:atm, :a}, {:cons, {:atm, :b}, {:atm, []}}}},
{:match, {:var, :y},
{:cons, {:atm, :c}, {:cons, {:atm, :d}, {:atm, []}}}},
{:call, :append, [{:var, :x}, {:var, :y}]}
]

    end
end