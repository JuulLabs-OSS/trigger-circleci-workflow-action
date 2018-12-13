FROM alpine:3.8

RUN apk add --no-cache curl

LABEL "com.github.actions.name"="Trigger CircleCI workflow"
LABEL "com.github.actions.description"="Trigger CircleCI workflow again when a PR has been opened."
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="blue"

COPY trigger-circleci-workflow.sh .

ENTRYPOINT ["trigger-circleci-workflow.sh"]
