@echo off
setlocal

set "ROOT=%~dp0"
set "BACKEND=%ROOT%comiplers-backend"
set "FRONTEND=%ROOT%compilers-frontend\Sayhut-frontend"

if not exist "%BACKEND%\app\main.py" (
  echo Backend directory was not found: %BACKEND%
  pause
  exit /b 1
)

if not exist "%FRONTEND%\package.json" (
  echo Frontend directory was not found: %FRONTEND%
  pause
  exit /b 1
)

start "Sayhut Backend" /D "%BACKEND%" cmd /k "python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"
start "Sayhut Frontend" /D "%FRONTEND%" cmd /k "npm run dev"

echo Backend: http://127.0.0.1:8000
echo Frontend: http://localhost:5173
