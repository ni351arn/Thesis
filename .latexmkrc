# Ensure glossaries (acronyms) are rebuilt automatically when using latexmk.
# This project uses the glossaries package (\makeglossaries + \printglossary).

use File::Basename;

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($infile) = @_;
    my ($base_name) = fileparse($infile, qr/\.[^.]*/);
    return system("makeglossaries \"$base_name\"");
}

$clean_ext .= ' acn acr alg glo gls glg glsdefs ist';

1;
