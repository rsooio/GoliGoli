FROM library/golang:1.17.5

# Godep for vendoring
RUN go get github.com/tools/godep

# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

ENV APP_DIR $GOPATHC:\OneDriveMaynooth\GoLang Project\GoliGoli
RUN mkdir -p $APP_DIR

# Set the entrypoint
ENTRYPOINT (cd $APP_DIR && ./C:\OneDriveMaynooth\GoLang Project\GoliGoli)
ADD . $APP_DIR

# Compile the binary and statically link
RUN cd $APP_DIR && CGO_ENABLED=0 godep go build -ldflags '-d -w -s'

EXPOSE 9000
