
# ardas-tools 

 Some scripts to ease interaction with ardas code.
 
 ## Deployment
 
 To deploy ardas-tools including ardas:
 
 
    rm -rf * .git .gitignore && git init && git remote add origin https://github.com/UMONS-GFA/ardas-tools.git && git pull origin master

    
## For production

To initiate stable branch of ardas:

    sh init_ardas.sh
    
To update stable branch:

    sh update_code.sh
    

## For developers
    
To initiate development branch of ardas:

    sh init_ardas.sh --dev
    
to update development branch:

T   sh update_code.sh --dev