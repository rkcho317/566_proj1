INCFLAGS  = -I include/GL
INCFLAGS += -I include/vecmath

INCFLAGS  = -I /usr/include/GL
INCFLAGS += -I /usr/include/vecmath

LINKFLAGS  = -lglut -lGL -lGLU
LINKFLAGS += -L /usr/lib/lvecmath -lvecmath

#LINKFLAGS = -lglut -lGL -lGLU
#LINKFLAGS += -L lib/vecmath -l:libvecmath.a

CFLAGS    = -O2 -Wall -ansi -DSOLN
CC        = g++
#SRCS     = main.cpp parse.cpp curve.cpp surf.cpp camera.cpp
SRCS      = $(wildcard *.cpp)
SRCS 	 += $(wildcard vecmath/*.cpp)
OBJS      = $(SRCS:.cpp=.o)
PROG      = a1

all: $(SRCS) $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LINKFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -c -o $@ $(INCFLAGS)

depend:
	makedepend $(INCFLAGS) -Y $(SRCS)

clean:
	rm $(OBJS) $(PROG)


