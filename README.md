
# ardas-tools
[![Doc Latest](https://img.shields.io/badge/docs-latest-brightgreen.svg?style=flat)](https://ardas-tools.readthedocs.io/en/latest/)


 Some scripts to ease interaction with ardas code.
 
 ## Deployment
 
 To deploy ardas-tools including ardas:
 
 
    rm -rf * .git .gitignore && git init && git remote add origin https://github.com/UMONS-GFA/ardas-tools.git && git pull origin master

    
## For production

To initiate stable branch of ardas:

    bash init_ardas.sh
    
To update stable branch:

    bash update_ardas.sh
    

## For developers
    
To initiate development branch of ardas:

    bash init_ardas.sh --dev
    
to update development branch:

    bash update_ardas.sh --dev
    
### options

Update code without automatically rebooting(only for update_ardas script)

    --noreboot
    
Create a new virtual environment and install all dependencies

    --pipenv