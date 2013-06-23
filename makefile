HTML=./html/
MD=./md/
MD_DIRS := ${shell find ${MD} -type d -print}

all: md

md: $(HTML)
	cd $(MD) && for i in ./*; do ../compile.sh $$i ../$(HTML)$$i; done

$(HTML):
	mkdir $(HTML)

clean:
	rm -r $(HTML)
