def generate_random_numbers(seed, count):
    # Define constants for the LCG algorithm
    a = 16807
    m = 2147483647

    # Start generating random numbers
    for _ in range(count):
        ran = a * seed % m
        seed = ran
        # print("Random number:", ran)

# Define the seed value and the number of random numbers to generate
seed_value = 123456789  # You can change this to any large number
number_of_random_numbers = 10  # You can change this to generate more numbers

# Generate random numbers using the LCG algorithm
generate_random_numbers(seed_value, number_of_random_numbers)

import numpy as np

# Set seed for reproducibility (optional)
np.random.seed(42)

# Generate a random integer between 1 and 100
random_number = np.random.rand(10000)
print("Random number:", random_number)
