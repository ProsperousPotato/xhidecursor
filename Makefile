PREFIX ?= /usr/local/bin

CFLAGS += -std=c99 -march=native -O3 -pipe
CFLAGS += -Wall
CFLAGS += -Wconversion
CFLAGS += -Wdouble-promotion
CFLAGS += -Wextra
CFLAGS += -Wmissing-prototypes
CFLAGS += -Wold-style-definition
CFLAGS += -Wpedantic
CFLAGS += -Wshadow

# OpenBSD
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
FREETYPEINC = ${X11INC}/freetype2

CFLAGS += -I${X11INC} -I${FREETYPEINC}
CFLAGS += -L${X11LIB}
CFLAGS += -lX11 -lXfixes -lXi
#

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
