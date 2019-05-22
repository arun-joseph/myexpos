#!/bin/bash

echo "ExpL"
cd ../expl
./expl ./expl_progs/idle.expl
./expl ./expl_progs/numbers.expl
./expl ./expl_progs/even.expl
./expl ./expl_progs/odd.expl

echo "SPL"
cd ../spl
./spl ./spl_progs/os_startup.spl
./spl ./spl_progs/timer.spl
./spl ./spl_progs/int7.spl
./spl ./spl_progs/int10.spl
./spl ./spl_progs/mod0.spl
./spl ./spl_progs/mod4.spl
./spl ./spl_progs/mod5.spl
./spl ./spl_progs/mod7.spl
./spl ./spl_progs/haltprog.spl

echo "XFS Interface"
cd ../xfs-interface
./xfs-interface fdisk
./xfs-interface load --os ../spl/spl_progs/os_startup.xsm
./xfs-interface load --exhandler ../spl/spl_progs/haltprog.xsm
./xfs-interface load --int=timer ../spl/spl_progs/timer.xsm
./xfs-interface load --int=7 ../spl/spl_progs/int7.xsm
./xfs-interface load --int=10 ../spl/spl_progs/int10.xsm
./xfs-interface load --module 0 ../spl/spl_progs/mod0.xsm
./xfs-interface load --module 4 ../spl/spl_progs/mod4.xsm
./xfs-interface load --module 5 ../spl/spl_progs/mod5.xsm
./xfs-interface load --module 7 ../spl/spl_progs/mod7.xsm
./xfs-interface load --library ../expl/library.lib
./xfs-interface load --init ../expl/expl_progs/odd.xsm
./xfs-interface load --idle ../expl/expl_progs/idle.xsm
./xfs-interface load --exec ../expl/expl_progs/even.xsm

echo "Completed."
