HTML=./html/
MD=./md/
MD_DIRS := ${shell find ${MD} -type d -print}

push: push_m5640 push_m1020

push_m5640:
	./get-gingko.sh SEM5640

push_m1020:
	./get-gingko.sh SEM1020

all: md

md: $(HTML)
	cd $(MD) && for i in ./*; do ../compile.sh $$i ../$(HTML)$$i; done

$(HTML):
	mkdir $(HTML)

clean:
	rm -r $(HTML)
