all: para6 para12

para6: para6.cpp
	g++ para6.cpp -o para6 -lboost_system  -lGL -lGLU -lglut

.PHONY: para6_test
para6_test: para6
	./para6 3:2:1:1:0:3:2:1:0:2:0:2:1:1:0:3:3:0:2:0:1:1:0:1:0:1:0:1:0:2:2:0:1:1:1:3:2:1:0:2:0:2:1:1:1:2:3:0:1:1:1:1:0:3:3:0:1:0:2:1:0:1:0:2:2:0:0:0:1:3:1:0:1:3:2:1:0:2:0:3:3:0:1:0:2:1:0

para12: para12.cpp
	g++ para12.cpp -o para12 -lboost_system -lGL -lGLU -lglut -I/usr/include/SDL2 -lSDL2 -lSDL2_image

.PHONY: para12_test
para12_test: para12
	./para12 3:2:1:1:0:3:2:1:0:2:0:2:1:1:0:3:3:0:2:0:1:1:0:1:0:1:0:1:0:2:2:0:1:1:1:3:2:1:0:2:0:2:1:1:1:2:3:0:1:1:1:1:0:3:3:0:1:0:2:1:0:1:0:2:2:0:0:0:1:3:1:0:1:3:2:1:0:2:0:3:3:0:1:0:2:1:0 cube1.png cube2.png cube3.png cube4.png cube5.png cube6.png

.PHONYE: clean
clean:
	rm -f para6
	rm -f para12
