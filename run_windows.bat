@echo off
cd /d %~dp0
if not exist .venv py -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -e .[dev]
if not exist data\sample_leads.xlsx python scripts\create_sample.py
start http://127.0.0.1:8000
python -m uvicorn app.main:app --reload
