Project selected for the e-life innovation sprint 2018.

# www.reagents.io
Vitrine at:
[www.reagents.io](http://reagents.io)

We are working to create a way to easily report accurate and exhaustive information about materials in the scientific literature, for the good of all scholars and a increased reproducibilty of research. The "reagent_table" will use transfer information from the provider, the lab inventory and the experiment into one spreadsheet:

<center>
<figure>
  <img src="data/figures/Scheme_01.jpeg" alt="" width="400"/>
  <figcaption>Three sources of information get pooled into the lab inventory and the published reagent table. Some information will be saved and transfered without even the scientists to notice.</figcaption>
</figure>
</center>




I believe that this project may only be successful if the whole scholar community (including scientists, literature curators, librarians and publishers) has his word and can tell what its needs are, i.e. be an open project.



## The problem:

- Less than 60% of the material described in the literature can be uniquely identified, these descriptions are not computer readable and are often behind paywalls. 
- Writing the material section of a manuscript is a tedious process, some reagents are often forgotted because there is no way to get a rapid overview of the list.


## Our solution pack (subject to change): 

Ultimately, information about reagents will be obtained from the providers during purchase and will be linked with lab inventory entries, themselves linked to data and project. Then reagent_table will be created automatically during manuscript edition. Reagents.io will create the framework and standards necessary for this workflow to work with different software solutions (ordering platforms, ELN, open notebook, manuscript submission portals,...).

In order to achieve this, we propose:

1. For each reagent, create reports with exhaustive information (probably in one or several spreadsheets). Three types of information can be included: information about the material itself (that can be obtained at the provider), information specific to the lab (location of the material for example), and information specific about onec experiments (for example antibody dilution, or age of the animal). One should be able to use these spreadsheets as a lab inventory.

2. Create a format to report material in one unique spreadsheet. It should be flexible for different reagents, have a maximum of 5 columns, easy to write by humanms, readable by machines, exhaustive, be useful for the scientists. Inspiration comes from the : [ART project](https://wiki.flybase.org/wiki/FlyBase:Author_Reagent_Table_(ART)){target="_blank"}, we will use a synthax of the type:

    ` origingal_spreadsheet_header:"*information*"; `

3. Create applications/R functions to move easily between the 2 formats.

3. Create a way to publish these tables independently of the manuscript publication, such that this information can be made open and FAIR, even if the manuscript is published in closed acecess.   

4. Create application(s) to get information during purchase, use it during expermients, link it to data, export it in publications, share it with colleagues,...

## Our next steps:

- make the community grow
- make prototypes for some reagents
- make a Rshiny app prototype

see [Roadmap](roadmap.md) for details

## Wanna help? We are welcoming any motivated volunteer

See the [contributing documentation](contributing.md) for information on how to
contribute. There is also the [roadmap](roadmap.md) for an overview of the goals 
and timelines. Please note that this project is released with a 
[Contributor Code of Conduct](CONDUCT.md). By participating in this project you
agree to abide by its terms.


#### We especially need 

1. non-coders:
    - Expertise about what one should report for each reagent type. Expertise about reagent providers and material publication guidelines.
    - Expertise/discussion/prototypes on how to report the information (human writable, computer readable)
    - A plan on how to make people use the standards (ease of use, benefits, communication,...)
    
2. People with IT knowledge:   
    - Expertise in data formats: spreadsheets created by the non-coders might be advantageously transformed into xml or RDF ??
    - Expertise in creating website from Rmarkdown, to make our results public in an easy to manage way.
    - Expertise in Rshiny apps development.
    - Expertise to develop your own project related to reagents.io
    
3. people with communication and business skills to build a plan to make this project sustainable (i.e. getting grants, derived business,...)



## The present team

- Julien Colomb, biologist, fruit fly expert, intermediate R coder, https://orcid.org/0000-0002-3127-5520
- Anita bandrowski, RRID specialist, https://orcid.org/0000-0002-5497-0243
- Melissa Harrison, elife,  https://orcid.org/0000-0003-3523-4408




## License

Since part of the project will be software, the MIT liscence was used for the repo. The content of the data folder is under a CC0 1.0 license.
