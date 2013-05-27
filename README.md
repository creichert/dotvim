
Installing
==========

    $ cd ~/.vim
    $ git submodue init
    $ git submodule update
    $ ./setup.sh

Generating tags
===============
    - First edit "generate_tags" to your liking.

    $ cd ~/.vim
    $ ./generate_tags

Shortcuts
=========

    \cp   - Generate clang_complete
    <F8>  - Generate c++ ctags (only useable from cpp file).
    <Tab> - Invoke autocomplete.
    f     - Follow symbol (tags need to be generated).
    s     - Pop tag from tagstack (move "back").
    Q     - Close all tabs.

