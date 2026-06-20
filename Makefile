PREFIX ?= /usr/local/bin

CFLAGS += -std=c99 -march=native -O3 -pipe -Wall -Wconversion -Wdouble-promotion -Wextra -Wmissing-prototypes -Wold-style-definition -Wpedantic -Wshadow

CFLAGS += -lX11 -lXfixes -lXi

all: xhidecursor

xhidecursor: main.c Makefile
	$(CC) $(CFLAGS) -o $@ main.c

install: all
	install -D xhidecursor $(DESTDIR)$(PREFIX)/xhidecursor

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/xhidecursor

clean:
	rm -f xhidecursor

.PHONY: all install uninstall clean
