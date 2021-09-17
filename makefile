TARGET=parser
CFLAGS= -g #-Wall
OBJS = parser.tab.o lex.yy.o


$(TARGET) : $(OBJS) 
	$(CC) -o $(TARGET) $(CFLAGS) $(OBJS) 
.c.o:
	$(CC) $(CFLAGS) -c $< 

parser.tab.c: parser.y
	bison -d $<

lex.yy.c: yylex.l
	flex  $<

test: $(TARGET)
	./test

clean:
	rm -f *.o *.c *.h $(TARGET) $(LEX)
