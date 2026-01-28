# LOG


## 28-1-2026

- bug HTML was not served correctly, adapted rec_html in records.py and protected.py
- bug fix: was no sorting in the table, adapted XSLT
- resources also mounted, so immediately change in XSLT becomes visible
- change to dev version of docker-compose

        docker compose -f docker-compose-dev.yml up

- test URL:

    http://localhost:1210/app/stalling/profile/clarin.eu:cr1:p_1708423613607/record/3/history

## 23-1-2026

- infrastructure for development setup


For development the integration of the service-huc-editor as code in the stalling can be fruitful.

In the docker compose you can see that this branch has the code from the service editor integrated.
From the branch dev-history. 

The basic image for development is a locally produced image. Burned from within huc-service-editor. 

Most directories are mounnted on the host system to the important directories within the image. 
An override of the CMD in the service-editor has been made. Hot reloading is now possible. 

Watch it!

Don't forget to add modified code in everyting but data to push to the service-huc-editor. 
Maybe, probably, a better workflow is possible. Open to discussion.