#!/opt/sw/julia-1.1.1/bin/julia

n = 30000000;
numprimes = 0;

function is_prime(n)
	if n == 0 | n == 1
		return 0
	elseif n == 2
		return 1
	end
	root_n = isqrt(n)
	for i = 2:root_n
		if n%i == 0
			return 0
		end
	end
	return 1
end



function primes_main()
	threadprimes = Threads.Atomic{Int}(0)
	Threads.@threads for i = 1:n
		if is_prime(i) == 1
			Threads.atomic_add!(threadprimes, 1)
		end
	end
	global numprimes = threadprimes[]
end


primes_main()


println("Number of Threads:")
println(Threads.nthreads())

println("Current Thread ID:")
println(Threads.threadid())



println("Number of Primes: ")
println(numprimes)

