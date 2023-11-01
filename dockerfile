FROM python:3.9

# 컨테이너 내에서 작업 디렉토리를 설정
WORKDIR /app

# 요구 사항 파일을 컨테이너로 복사
COPY requirements.txt .

RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY . /app

# 컨테이너 내부에서 80번 포트를 외부와 연결할 수 있도록 설정
EXPOSE 80

ENV NAME FastAPIApp

# 컨테이너가 시작될 때 FastAPI 애플리케이션을 실행합니다
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]