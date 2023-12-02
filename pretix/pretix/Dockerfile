FROM pretix/standalone:latest
USER root
RUN pip3 install pretix-sepadebit
RUN pip3 install pretix-question-placeholders
RUN pip3 install pretix-pages
RUN pip3 install pretix-zugferd
RUN pip3 install pretix-covid-certificates
USER pretixuser
RUN cd /pretix/src && make production
VOLUME ["/etc/pretix", "/data"]
EXPOSE 80
ENTRYPOINT ["pretix"]
CMD ["all"]
