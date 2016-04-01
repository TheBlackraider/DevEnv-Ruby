FROM blackraider/devenv-base 

MAINTAINER blackraider <er.blacky@gmail.com>

#RUN pacman-key --refresh-keys

USER root

RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade

RUN pacman -S --noconfirm ruby ruby-docs nodejs zlib

USER developer

ADD .vimrc /home/developer

RUN mkdir -p /home/developer/projects/ruby
RUN mkdir -p /home/developer/projects/rails

RUN gem install bundler rails haml-rails twitter-bootstrap-rails pry-rails awesome_print devise compass better_errors pry pry-doc annotate sinatra commander ruby-progressbar paint mechanize rails_apps_composer sinatra tty rails_apps_composer

RUN sed -i '$ a export PATH=$PATH:/home/developer/.gem/ruby/2.3.0/bin/' /home/developer/.bashrc

RUN sed -i '$ a export PATH=$PATH:/home/developer/.gem/ruby/2.3.0/bin/' /home/developer/.zshrc


VOLUME /home/developer/projects/ruby
VOLUME /home/developer/projects/rails

EXPOSE 3000 80 8080

