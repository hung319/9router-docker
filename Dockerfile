# Sử dụng image Bun Alpine chính thức
FROM oven/bun:alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt libc6-compat để tương thích thư viện C trên Alpine
RUN apk add --no-cache libc6-compat

# Cài đặt 9router toàn cục
RUN bun add -g 9router@latest

# --- PHẦN SỬA LỖI ENOENT ---
# Tạo thư mục cấu hình mà 9router yêu cầu
RUN mkdir -p /root/.9router && touch /root/.9router/db.json
# ---------------------------

# Thêm đường dẫn bin vào PATH
ENV PATH="/root/.bun/bin:${PATH}"

# Mở cổng 20128
EXPOSE 20128

# Chạy 9router
CMD ["9router"]
