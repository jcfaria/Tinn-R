6.1.1.6 (mai/09/2020)
---------------------

-   Bug(s) fixed:

    -   All dependencies of the TinnRcom package that are distributed
        with the Tinn-R setup (formatR, svMisc and svSocket), as well as
        the TinnRcom package itself, have been rebuilt with the R-devel
        version (4.1). The startup issues that arose in the current
        version 4.0 of R have been fixed.

    -   A bug associated with the package `semPlot` was fixed. Thanks to
        `Frank` for pointing it out.

-   Filter of `Tools/R/Mirros` from now on will be applied by `Host`.

6.1.1.5 (jan/06/2020)
---------------------

-   Some improvements and refinements have been made in the previous
    version 6.1.1.4.

6.1.1.4 (jan/02/2020)
---------------------

-   Many improvements and refinements have been made in the previous
    version 6.1.1.3.

6.1.1.3 (jan/02/2020)
---------------------

-   Some parts of the Object Pascal **pipe** were rewritten. It is now
    faster, stable and robust.

-   The handling of all shortcuts, keystrokes and hotkeys are now
    centered on a single user interface that is simpler and more
    efficient than previous options. As result, a new menu option has
    been created: `Options/Shortcuts/keystrokes/hotkeys (map)`. It was a
    very hard and time consuming work, we hope you enjoy the
    final results.

-   We are looking for the maximum freedom and efficiency to interact
    with the R interpreter. Thus, improvements have been made to the
    `Rterm IO` interface:

    -   From now on, to send any prior line (or just any selection) to
        the R interpreter, you must press the **CTRL + ENTER** shortcut
        keys (not configurable).

    -   In the latest line the user can use: a simple **ENTER** or
        **CTRL + ENTER** to send the current line.

    -   The `R history` can be visualized (and filtered progressively as
        you type) in a new `SynEdit completion window`. The shortcut is
        **CTRL + ALT + SPACE** (not configurable).

-   From now on, the shortcut **CTRL + ENTER** (not configurable) is
    also associated to send line (or selection) from the Editor to
    the interpreter. The previous use (send the current line and insert
    a new one) was removed. This was an old request from users but we
    believe it is no longer used much. Therefore, unless otherwise
    stated, we don’t wish wish to make this feature available anymore.

-   The option to send the clipboard content, with shortcut **CTRL + Q**
    by default, to interpreter was removed.

-   The `R highlighter` was improved, it has new objects and from now
    on, will be case sensitive. That is, it will highlight, for example,
    **LETTERS, letters, CO2, co2, …**, recognized and different R
    objects, in the same group with the same attributes.

-   From this version, the instructions stored in `R history` are only
    those typed in and submitted directly into `Rterm IO` interface.

-   The highlighter identifier `Note` was renamed to `Note_0`. It makes
    more sense, since `Note_1` and `Note_2` were created in
    previous version.

-   Due to low usage, all shortcuts (default) associated with Txt2tags
    to Deplate converters have been removed.

-   A new shortcut (default) has been associated with the option
    `Save file as: SHIFT+CTRL+S`.

-   The interface `Highlighters setting` was improved. From now on, the
    program will be distributed with at least 4 fast coloring sets:
    Default, Dark, Gray and LGray. Additionally, the interface allows
    you to restore all default values with a new option.
