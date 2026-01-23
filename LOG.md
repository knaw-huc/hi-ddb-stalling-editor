# LOG

From MvdP.

For development the integration of the service-huc-editor as code in the stalling can be fruitful.

In the docker compose you can see that this branch has the code from the service editor integrated.From the branch dev-history. 

The basic image for development is a locally produced image from within the huc-service-editor. 

The important directories are mounnted on the host system to the important directories within the image. 
An override of the CMD in the service-editor has been made. Hot reloading is now possible. 

Important for development.

Don't forget to add modified code in everyting but data to push to the service-huc-editor. 
Maybe, probably, a better workflow is possible. Open to discussion.