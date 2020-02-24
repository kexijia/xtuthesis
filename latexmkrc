# vim: set ft=perl:

$pdf_mode = 1;

$pdflatex = 'xelatex -interaction=nonstopmode -shell-escape %O %S';
# $pdflatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";

$bibtex_use = 1.5;

$clean_ext = "hd loe synctex.gz thm xdv";

$makeindex = "makeindex -s gind.ist %O -o %D %S";
add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, 'glo', 'gls';

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, 'nlo', 'nls';
