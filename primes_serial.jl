#!/opt/sw/julia-1.1.1/bin/julia

# declare size n and number of primes
n=30000000;
numprimes = 0;


# funtion is_prime determines if a function is prime or not.
#	if it is, then a 1 is returned.
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

# if a 1 is returned from function is_prime(), then this for
#	loop runs to increment numprimes to show how many prime
#	numbers there are within the number n.
for i = 1:n
	if is_prime(i) == 1
		global numprimes += 1
	end
end

# Print out the number of primes to the user
println("Number of Primes: ")
println(numprimes)
