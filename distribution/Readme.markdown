5.3.3.1 (fev/25/2019)
---------------------

-   Bug(s) fixed:

    -   A bug associated to the procedure `Help/Check for update` and
        the prior `5.3.2.1 (fev/12/2019) portable` version was fixed.

5.3.2.1 (fev/12/2019)
---------------------

-   The recognition of complex R object names for `print`, `plot`,
    `names` `structure`, `edit`, `fix`, `help`, `example` and
    `open example` were improved. For example, to all cases:

    -   iris

    -   iris\[1\]

    -   iris\[c(1, 2)\]

    -   iris3(1, 1, 3)

    -   iris$Sepal.Length

    -   iris\[’Sepal.Length’\]

    -   iris\[\[“Sepal.Length”\]\]

    that it will be correctly recognized.

-   The `Replace` procedure was improved. From now it will remember, for
    all files, the same word list used to replacement.

-   The was updated, the new URL is:
    **https://nbcgib.uesc.br/tinnr/en/**.


