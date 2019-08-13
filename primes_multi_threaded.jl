#!/opt/sw/julia-1.1.1/bin/julia

# declare size n and number of primes
n = 30000000;
numprimes = 0;

# function is_prime determines if a function is prime or not.
#	if it is, then a 1 is returned
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


# function primes_main() creates an Atomic variable threadprimes
#	to properly maintain the correct result of number of primes during parallelization. If a 1 is 
#	returned from the function is_prime(), then the for loop within primes_main() increments 
#	threadprimes by 1 via the Threads.atomic_add! function.  Then in order to return threadprimes,
#	the number of threadprimes is assigned to numprimes, which is later printed to the user.
function primes_main()
	threadprimes = Threads.Atomic{Int}(0)
	Threads.@threads for i = 1:n
		if is_prime(i) == 1
			Threads.atomic_add!(threadprimes, 1)
		end
	end
	global numprimes = threadprimes[]
end

# execute main function
primes_main()

# print the number of threads being used
println("Number of Threads:")
println(Threads.nthreads())

# print the current thread ID 
println("Current Thread ID:")
println(Threads.threadid())


# print the number of primes to the user 
println("Number of Primes: ")
println(numprimes)

