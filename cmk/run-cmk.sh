#!/bin/bash

# --rm because al data is gathered ouside the container
# --privileged because tmpfs can only be used when container has those rights

# -v /MAGWEG/ is for extracting the sites to outside the container
# -v /MAGWEG/passwd is becuase user needs to exist for the site to work.

# And bash because currently the container is not runnable

docker run \
	-it \
	 \
	--privileged \
	-v /MAGWEG/sites:/opt/omd/sites \
	-p 8000:80 \
	frankij/cmk \
	bash
