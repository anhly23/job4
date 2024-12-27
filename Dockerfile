# Sử dụng Python 3.12 Alpine (nhẹ và tối ưu)
FROM python:3.12-alpine

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép tệp requirements.txt và cài đặt các phụ thuộc
COPY requirements.txt .  
RUN pip install --no-cache-dir -r requirements.txt  

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Mở cổng 5000 cho Flask
EXPOSE 5000

# Chạy ứng dụng Flask bằng Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
