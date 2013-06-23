P=pandoc
P_FLAGS=--smart --standalone --table-of-contents --mathml --from=markdown --to=html
HTML=./html/
MD=./md/
MD_DIRS := ${shell find ${MD} -type d -print}

all: md

md: dirs
	cd $(MD) && find . -name *.md -exec $(P) $(P_FLAGS) {} --output ../$(HTML){}.html \;

dirs: $(HTML)
	cd $(MD) && find . -type d -exec mkdir -p "../$(HTML){}" \;

$(HTML):
	mkdir $(HTML)

clean:
	rm -r $(HTML)
