# misc
Miscellaneous scripts, utilities, etc. Fresh nectar is welcome

Travis CI tools
---------------

### Clang/GCC updaters:

    $ ./travis/cpp/gcc_update.sh --version 4.9

This script updates travis default GCC version. Parameters:

 - `-v/--version`: GCC version, dot syntax.
 - `-r/--repository`: Ubuntu repository to get GCC update from.

---

    $ ./travis/cpp/clang_update.sh --version 3.4

This script updates travis default Clang version. Parameters:

 - `-v/--version`: Clang version, dot syntax.
 - `-r/--repository`: Ubuntu repository to get Clang update from.
 - `--libc++`: Build libc++ library. Note this does not add `-stdlib=libc++ -lc++abi` and related flags
               to your compiler. Don't forget to pass `libc++` headers (`/usr/include/c++/v1/`) to your compiler
               include path to fully override default `stdlibc++`.
 - `--libcpp-upstream`: URL of the SVN repository with `libc++` sources.
  
