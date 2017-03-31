
CHEX_EXE = chex.exe
UDOOM_EXE = doom.exe

output/chex/mobjinfo: $(CHEX_EXE)
	./dump-mobjinfo $< 000a5a84 > $@
output/chex/states: $(CHEX_EXE)
	./dump-states $< 0009f0c0 > $@
output/chex/strings: $(CHEX_EXE)
	./dump-strings $< > $@

output/udoom/mobjinfo: $(UDOOM_EXE)
	./dump-mobjinfo $< 000a5660 > $@
output/udoom/states: $(UDOOM_EXE)
	./dump-states $< 0009ec9c > $@
output/udoom/strings: $(UDOOM_EXE)
	./dump-strings $< > $@

diff-mobjinfo : output/udoom/mobjinfo output/chex/mobjinfo
	diff -u $^
diff-states : output/udoom/states output/chex/states
	diff -u $^
diff-strings : output/udoom/strings output/chex/strings
	diff -u $^

