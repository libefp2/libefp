check:
	@EFPMD=../build/efpmd/efpmd ./run.sh

checkomp:
	@for thr in 1 2 3; do \
		echo "Testing for $$thr thread(s)..."; \
		OMP_NUM_THREADS=$$thr EFPMD=../build/efpmd/efpmd ./run.sh; \
	done

checkmpi:
	@for prc in 1 2 3; do \
		echo "Testing for $$prc process(es)..."; \
		EFPMD="mpirun -np $$prc ../build/efpmd/efpmd" ./run.sh; \
	done

clean:
	rm -f *.out

.PHONY: check checkomp checkmpi clean
