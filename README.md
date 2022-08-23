# Drug database statistics

## Build Docker Image

* Download all DrugBank versions recorded as XML files, from version 3.0  (January 2011) to version 5.1.9 (January 2022). Access to download the database versions is free with a validated account; an account can be created with an institutional email. The DrugBank versions 5.1.9 to 4.5.0 can be downloaded from [https://go.drugbank.com/releases](https://go.drugbank.com/releases) and 4.3 to 3.0 from [https://go.drugbank.com/downloads/archived](https://go.drugbank.com/downloads/archived).

* Each XML file must be saved following a naming convention to avoid file overwriting. Therefore each DrugBank XML file is saved as *drugbank_version.xml* in the **Drugbank** directory. 

**Examples:** `drugbank_3.0.xml`, `drugbank_5.1.8.xml`, `drugbank_5.1.9.xml` 

* Build image

`docker build --build-arg wolframId=<wolfram account email> --build-arg wolframPass=<wolfram account password> -t hyperion . `

* Running image

`docker run -t -i hyperion /bin/bash `

## Interactive script

* In docker container run `./execute_scripts.sh [-h]|[-i][-s]`.  By invoking the script with the **-i** parameter, it will build and analyze DDI and DTI networks for each DrugBank version; if it is invoked with the **-s** parameter, it will build the networks and run the robustness analysis. **-h** option is for showing the help.

**Example**

```
root@59ed68e0d3d8:/code# ./execute_scripts.sh -h
Usage sh execute_scripts.sh [-i|-s|-h]. -i=Execute jupyter notebooks. -s=Execute robustness tests. -h=help
```



