Set-Location $PSScriptRoot
if (-not (Test-Path .venv)) { py -m venv .venv }
& .\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
if (-not (Test-Path data\sample_leads.xlsx)) { python scripts\create_sample.py }
Start-Process "http://127.0.0.1:8000"
python -m uvicorn app.main:app --reload
