FROM centos:latest
MAINTAINER vikashashoke@gmail.com

# Update yum
RUN yum update -y || (echo "yum update failed" && exit 1)

# Install httpd
RUN yum install -y httpd || (echo "installing httpd failed" && exit 1)

# Install zip
RUN yum install -y zip || (echo "installing zip failed" && exit 1)

# Install unzip
RUN yum install -y unzip || (echo "installing unzip failed" && exit 1)

# Clean yum cache
RUN yum clean all

# Add the photogenic.zip file and extract its contents
ADD ./photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set the command to run httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80

 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
