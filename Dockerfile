# Sử dụng image Bun Alpine chính thức
FROM oven/bun:alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt các thư viện cần thiết để chạy các package Node.js trên Alpine
# libc6-compat giúp tương thích với các ứng dụng biên dịch cho Linux thông thường
RUN apk add --no-cache libc6-compat

# Cài đặt 9router toàn cục
RUN bun add -g 9router

# Thêm đường dẫn bin của bun vào PATH để nhận diện lệnh 9router
ENV PATH="/root/.bun/bin:${PATH}"

# Mở cổng 20128
EXPOSE 20128

# Chạy 9router
CMD ["9router"]
