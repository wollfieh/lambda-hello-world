FROM golang:1.23 as build
WORKDIR /helloworld
# Copy dependencies list
COPY src /helloworld/
RUN go build -tags lambda.norpc -mod=vendor -o main main.go
# # Copy artifacts to a clean image
FROM public.ecr.aws/lambda/provided:al2023
# FROM public.ecr.aws/lambda/provided:al2.2025.01.10.07
COPY --from=build /helloworld/main ./main
ENTRYPOINT [ "./main" ]