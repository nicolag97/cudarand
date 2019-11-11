FLAGS=-std=c++11 -Wno-deprecated-gpu-targets
TARGS_OUTPUT=RNG.o OutputTest.o
NVCC=nvcc

ECHO=/bin/echo

all: output

output:  $(TARGS_OUTPUT)
	$(NVCC) $(FLAGS) $(TARGS_OUTPUT) -o OutputTest.x

%.o: %.cu
	$(NVCC) $(FLAGS) -dc $< -o $@

clean:
	@rm -f *.x *.o && echo "Done cleaning."


run: clean
	@make --no-print-directory
	@$(ECHO) "Running RandomGenerator output test..."
	@./OutputTest.x
