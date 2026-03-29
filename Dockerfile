# Sử dụng Bun trên nền Alpine để có kích thước nhỏ nhất (~50MB)
FROM oven/sh:alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt 9router toàn cục
# Alpine dùng tài khoản 'root' mặc định, ta cài trực tiếp vào bin
RUN bun add -g 9router

# Mở cổng 20128
EXPOSE 20128

# Chạy trực tiếp từ đường dẫn binary của bun toàn cục
CMD ["/root/.bun/bin/9router"]
