FROM python:3.8.2-alpine

RUN apk update
RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev

RUN pip install pipenv

WORKDIR /usr/src/poker

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock
RUN pipenv install --system

COPY . .

ENTRYPOINT [ "./start.sh" ]
