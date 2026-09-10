# 使用官方輕量版 Python 基礎環境
FROM python:3.10-slim

# 設定容器內部的工作目錄
WORKDIR /app

# 將套件清單複製到容器並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 將專案內的所有檔案複製到容器內
COPY . .

# 暴露 8000 連線埠
EXPOSE 8000

# 啟動 FastAPI 服務，並監聽 Render 分配的 PORT（若無環境變數預設為 8000）
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]