@echo off
setlocal
set STREAMLIT_BROWSER_GATHER_USAGE_STATS=false
set STREAMLIT_SERVER_HEADLESS=true
set SCRIPT_DIR=%~dp0
set PATH=%SCRIPT_DIR%\.venv\Scripts;%PATH%
cd /d "%SCRIPT_DIR%"
"%SCRIPT_DIR%\.venv\Scripts\python.exe" -m streamlit run main.py --server.port 8501 --server.headless true
