LIBTORCH_A= libtorch.a
LIBTORCH_O= torch.o

AR= ar rc
RANLIB= ranlib

$(LIBTORCH_A): $(LIBTORCH_O)
	$(AR) $@ $(LIBTORCH_O)
	$(RANLIB) $@

clean:
	rm -f $(LIBTORCH_A) $(LIBTORCH_O)

.PHONY: clean
