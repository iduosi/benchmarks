################## https://github.com/TechEmpower/FrameworkBenchmarks #####################

#
# by iduosi@icloud.com
#

FROM buildpack-deps:bionic

RUN apt-get -yqq update \
	&& apt-get -yqq install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
		git-core cloc dstat python-dev python-pip \
		software-properties-common libmysqlclient-dev

RUN pip install colorama==0.3.1 requests MySQL-python psycopg2-binary pymongo docker==4.0.2 psutil \
	\
	&& apt-get install -yqq siege \
	\
	&& cp -r /usr/local/lib/python2.7/dist-packages/backports/ssl_match_hostname/ /usr/lib/python2.7/dist-packages/backports

ENV PYTHONPATH /benchmarks
ENV BENCHMARK_ROOT /benchmarks

# CMD ["python"]
ENTRYPOINT ["python", "/benchmarks/toolset/run-test.py"]
