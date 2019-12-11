@PROJECT_NAME@
====================================

This is a small tool that will quickly initialize your C++ w/ Cmake project.

**ATTENTION, this software is in the alpha state!**

Any [feedback][mail] (*especially results of testing*) is highly appreciated!

Features
========

Builds a command line executable and your choice of a static/shared library.


Examples
=======

```cpp

#include <iostream>

int main()
{
   std::cout<<"Hello!\n";
   return 0;
}
```

Installation 
==========================

Dependencies
------------

- [CMake] build system version 3.13+;
- C++17 compiler ([GCC] 7.3+)
- GNU rename utility (for file renaming) //TODO remove this dependancy

Build time settings
-------------------


Installation on Linux
---------------------

    $ sudo apt install rename
    $ git clone https://github.com/adamfill28/cpp_project_template
    $
    $ ./init.sh -n <project name> -u <your name> -e <your email>
    $
    $ cd <project name>
    $ 
    $ mkdir build && cd build
    $ cmake ..
    $ make && make install


Tests 
==========================

There are no tests yet.

License
=======

This library is distributed under the XYZ license. For conditions of distribution and use,
see file `LICENSE.txt`.

Feedback
========

Any feedback are welcome. [Contact us][mail].

Copyright
=========

copyright info....

[mail]: @email@

[CMake]: https://cmake.org/
[GCC]: https://gcc.gnu.org/