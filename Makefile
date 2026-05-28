.PHONY: build clean rebuild

build: build/chapters build/config
	pdflatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1
	biber thesis
	pdflatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1
	pdflatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1
	mv thesis.aux thesis.bbl thesis.blg thesis.bcf thesis.log thesis.fls thesis.fdb_latexmk thesis.acn thesis.acr thesis.alg thesis.glo thesis.gls thesis.glg thesis.ist thesis.lof thesis.lot thesis.lol thesis.slo thesis.slg thesis.sls thesis.toc build/ 2>/dev/null || true
	cp chapters/*.aux build/chapters/ 2>/dev/null || true
	@echo "✓ Thesis compiled successfully to build/thesis.pdf"

build/chapters:
	@mkdir -p build/chapters

build/config:
	@mkdir -p build/config

clean:
	rm -f build/thesis.* build/*.bbl build/*.blg build/chapters/*.aux

rebuild: clean build
