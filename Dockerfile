# Sử dụng một hình ảnh Python chính thức làm ảnh nền
FROM python:3.12-alpine AS python-app

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép nội dung thư mục hiện tại vào container tại /app
COPY . /app

# Cài đặt các phụ thuộc
RUN pip install --no-cache-dir flask gunicorn

# Sao chép tệp requirements.txt và cài đặt các phụ thuộc
COPY requirements.txt .
RUN pip install -r requirements.txt

# Mở cổng 5000 cho bên ngoài container
EXPOSE 5000

# Định nghĩa lệnh để chạy ứng dụng với Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

# Tạo container Ubuntu SSH
# FROM ubuntu AS ssh-ubuntu

# RUN apt update && apt install openssh-server sudo -y
# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin
# RUN echo 'admin:admin' | chpasswd
# RUN service ssh start
# EXPOSE 2222
# CMD ["/usr/sbin/sshd", "-D"]

# # Tạo container CentOS 7 SSH
# FROM centos:7 AS ssh-centos7

# RUN yum install openssh-server -y
# RUN echo 'root' | passwd --stdin root
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
# EXPOSE 2227
# CMD ["/usr/sbin/sshd", "-D"]
