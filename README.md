# flexgen-playground

# Required
- [NVIDIA Container Toolkit](https://nvidia.github.io/nvidia-container-runtime/)

# Running
```
$ make
$ docker run --rm -i -t --gpus all takumi/flexgen-playground:latest
# python3 chatbot.py --model facebook/opt-6.7b --compress-weight
```

# See also
https://github.com/gradio-app/gradio/
