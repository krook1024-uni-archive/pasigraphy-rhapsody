TEX = latexmk -pdflatex=lualatex -interaction=nonstopmode -pdf -f

all: con_prel_para.tex para_prog_guide.tex hungarian_mitel.tex vis_prel_para.tex
	$(TEX)

con_prel_para.pdf: con_prel_para.tex
	$(TEX) con_prel_para.tex

para_prog_guide.pdf: para_prog_guide.tex
	$(TEX) para_prog_guide.tex

hungarian_mitel.pdf: hungarian_mitel.tex
	$(TEX) hungarian_mitel.tex

vis_prel_para.pdf: vis_prel_para.tex
	$(TEX) vis_prel_para.tex

.PHONY: clean
clean:
	latexmk -c
