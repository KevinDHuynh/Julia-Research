n = 10000000;
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



function main()
	threadprimes = Threads.Atomic{Int}(0)
	Threads.@threads for i = 1:n
		if is_prime(i) == 1
			global numprimes = Threads.atomic_add!(threadprimes, 1)
		end
	end
end


main()


println("Thread ID:")
println(Threads.threadid())



println("Number of Primes: ")
println(numprimes)