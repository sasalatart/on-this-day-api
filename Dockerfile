FROM ruby:2.3-onbuild

MAINTAINER Sebastian Salata R-T <SA.SalataRT@GMail.com>

ENV RACK_ENV production

EXPOSE 9292

CMD ["rackup", "config.ru"]
