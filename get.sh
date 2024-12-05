#!/bin/bash
aria2c http://nopaystation.com/tsv/PS3_GAMES.tsv -o 1.tsv
aria2c http://nopaystation.com/tsv/PS3_DLCS.tsv -o 2.tsv
aria2c http://nopaystation.com/tsv/PS3_THEMES.tsv -o 3.tsv
aria2c http://nopaystation.com/tsv/PS3_AVATARS.tsv -o 4.tsv
aria2c http://nopaystation.com/tsv/PS3_DEMOS.tsv -o 5.tsv
aria2c http://nopaystation.com/tsv/pending/PS3_GAMES.tsv -o 6.tsv
aria2c http://nopaystation.com/tsv/pending/PS3_DLCS.tsv -o 7.tsv
aria2c http://nopaystation.com/tsv/pending/PS3_THEMES.tsv -o 8.tsv
aria2c http://nopaystation.com/tsv/pending/PS3_AVATARS.tsv -o 9.tsv
aria2c http://nopaystation.com/tsv/pending/PS3_DEMOS.tsv -o 0.tsv

(cat 1.tsv; echo ""; tail -n +2  6.tsv) > pkgfiles/USRDIR/PS3_GAMES.tsv
(cat 2.tsv; echo ""; tail -n +2  7.tsv) > pkgfiles/USRDIR/PS3_DLCS.tsv
(cat 3.tsv; echo ""; tail -n +2  8.tsv) > pkgfiles/USRDIR/PS3_THEMES.tsv
(cat 4.tsv; echo ""; tail -n +2  9.tsv) > pkgfiles/USRDIR/PS3_AVATARS.tsv
(cat 5.tsv; echo ""; tail -n +2  0.tsv) > pkgfiles/USRDIR/PS3_DEMOS.tsv

