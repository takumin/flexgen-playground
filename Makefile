#
# Environment Variables
#

REPOSITORY ?= takumi/flexgen-playground

#
# Docker Build Variables
#

BUILD_ARGS ?=

ifneq (x${no_proxy}x,xx)
BUILD_ARGS += --build-arg no_proxy=${no_proxy}
endif
ifneq (x${NO_PROXY}x,xx)
BUILD_ARGS += --build-arg NO_PROXY=${NO_PROXY}
endif

ifneq (x${ftp_proxy}x,xx)
BUILD_ARGS += --build-arg ftp_proxy=${ftp_proxy}
endif
ifneq (x${FTP_PROXY}x,xx)
BUILD_ARGS += --build-arg FTP_PROXY=${FTP_PROXY}
endif

ifneq (x${http_proxy}x,xx)
BUILD_ARGS += --build-arg http_proxy=${http_proxy}
endif
ifneq (x${HTTP_PROXY}x,xx)
BUILD_ARGS += --build-arg HTTP_PROXY=${HTTP_PROXY}
endif

ifneq (x${https_proxy}x,xx)
BUILD_ARGS += --build-arg https_proxy=${https_proxy}
endif
ifneq (x${HTTPS_PROXY}x,xx)
BUILD_ARGS += --build-arg HTTPS_PROXY=${HTTPS_PROXY}
endif

#
# Docker Run Variables
#

RUN_ARGS ?=

#
# Default Rules
#

.PHONY: all
all: build

#
# Build Rules
#

.PHONY: build
build:
	@docker build -t $(REPOSITORY):latest $(BUILD_ARGS) .

#
# Run Rules
#

.PHONY: run-opt-6.7b
run-opt-6.7b:
	@docker run --rm -i -t -v $(CURDIR)/.cache:/cache --gpus all $(REPOSITORY):latest \
		python3 chatbot.py --model facebook/opt-6.7b --compress-weight

.PHONY: run-opt-30b
run-opt-30b:
	@docker run --rm -i -t -v $(CURDIR)/.cache:/cache --gpus all $(REPOSITORY):latest \
		python3 chatbot.py --model facebook/opt-30b --compress-weight

.PHONY: run-opt-66b
run-opt-66b:
	@docker run --rm -i -t -v $(CURDIR)/.cache:/cache --gpus all $(REPOSITORY):latest \
		python3 chatbot.py --model facebook/opt-66b --percent 50 10 100 0 100 0 --compress-weight

#
# Clean Rules
#

.PHONY: clean
clean:
	@docker system prune -f
	@docker volume prune -f

.PHONY: distclean
distclean:
	@sudo git clean -xdf .
