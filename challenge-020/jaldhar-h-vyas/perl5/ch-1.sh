perl -E '$_ = shift; s/ (.+?) \K (?!\g{1} | $) /\", \"/gx; say "\"$_\"";' "ABBCDEEF"