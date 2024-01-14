FROM node:18 AS node

RUN apt-get update && \
    apt-get install -y xvfb \
    libgbm1 \
    libxss1 \
    libnss3 \
    libgtk-3-dev \
    libasound2-dev \
    vim \
    unzip \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

COPY . /e2e

RUN cd e2e && npm i && npm run build

RUN chmod +x /e2e/entrypoint.sh
RUN dos2unix /e2e/entrypoint.sh

ENV ELECTRON_ENABLE_STACK_DUMPING=true
ENV ELECTRON_ENABLE_LOGGING=true

RUN npm install -g playwright
RUN npx playwright install --with-deps chrome

WORKDIR e2e

ENTRYPOINT [ "/e2e/entrypoint.sh" ]