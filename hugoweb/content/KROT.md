+++
title = "Key reagent OPEN table"
description = "information"

+++

You may have heard of the Star method table (cell), or the key reagent table (elife). These are nice initiatives to guide researchers into the best ways to report materials. On the other hand, the RRID initiative has been gathering a lot of information about reagents and given them persistent labels. Unfortunately, these initiatives are poorly linked, and the format of the tables is not meant to be computer readable. With the key reagent open table, we want to create an open standard on how to report  material in one unique, small spreadsheet. Ultimately, this table structure might be exported in JATSxml format to be included in the publication metadata itself.

In contrast to previous attempts, we are not aiming at a simple table that would fit all types of reagents, but we are planning on creating reagent specific metadata standards (in table forms) and an application to transform these specific spreadsheets into a simpler, human readable **key reagent open table**. The amount of data exported might depend on the use of the krot (a compact table to be inserted in publication, spreadsheet or json file to publish independently, xml to include in the publication,...)




The krot itself should be flexible for different reagents, have a maximum of 5 columns, easy to write by humanms, readable by machines, pretty exhaustive, and be useful for the scientists for their inventory. 

Inspiration comes from the : [ART project](https://wiki.flybase.org/wiki/FlyBase:Author_Reagent_Table_(ART)){target="_blank"} (the star method table is too simplistic). In the column, in order to pool different information into one column, we will use a synthax of the type:

    ` origingal_spreadsheet_header:"*information*"; `

Each reagent will indeed have its spreadsheet with unlimited number of columns. Each columns will be assigned a column in each KROT versions. A small application will transform formats into one other. 

*example to come*

---

