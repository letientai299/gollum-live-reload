FROM ruby:2.5.3
RUN apt-get update && apt-get install git -y
RUN gem install gollum github-markdown guard guard-livereload guard-yield --no-ri --no-doc
COPY . /src
WORKDIR /src/

# Run the gollum with its default port 4567
CMD ["./run.sh"]

# 4567 is gollum port, 35729 is browser live reload default port
EXPOSE 4567 35729
