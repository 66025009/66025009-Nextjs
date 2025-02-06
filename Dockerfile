# ใช้ Node.js เป็น Base Image
FROM node:18-alpine 

# กำหนด Working Directory ใน Container
WORKDIR /app

# คัดลอกไฟล์ทั้งหมดไปยัง Container
COPY . .

# ติดตั้ง Dependencies
RUN npm install

# Build Next.js (ถ้าใช้ `next start` ต้อง Build ก่อน)
RUN npm run build

# เปิดพอร์ตที่ Next.js ใช้
EXPOSE 3000

# รันเซิร์ฟเวอร์
CMD ["npm", "run", "start"]
