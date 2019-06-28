FROM tensorflow/serving

# MAINTAINER
MAINTAINER wenfengand@gmail.com 
# running required command

COPY ./voice /models/voice

# change dir to /
WORKDIR /workspace
CMD [ "/workspace/serve.sh" ]
