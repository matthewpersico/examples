## -*- sh -*-

for useend in NOEND END
do
    for location in stayhere gothere
    do
        for exitval in die 0 1
        do
            echo '------------'
            echo ./tempdir.pl $location $exitval $useend
            ./tempdir.pl $location $exitval $useend
            ls -ld $(cat tempdir.dat)
            echo
        done
    done
done
