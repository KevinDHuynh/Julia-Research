n = 10000000;
sum = 0;


function add_main()
        threadadd = Threads.Atomic{Int}(0)
        Threads.@threads for i = 1:n
                Threads.atomic_add!(threadadd, n+1)
        end
        global sum = threadadd[]
end


add_main()


println("Number of Threads:")
println(Threads.nthreads())

println("Current Thread ID:")
println(Threads.threadid())



println("Total sum: ")
println(sum)

