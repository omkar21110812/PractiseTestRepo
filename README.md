# Export Sales Platform - Phase 1 Complete

A modular, Windows-first Python application for international-export buyer qualification. It is designed to grow into a CRM and n8n-enabled sales platform without replacing the Phase 1 core.

## Phase 1 features
- FastAPI web/API application with Swagger documentation
- XLSX/CSV buyer import and row-level error reporting
- Optional public website text research
- Configurable deterministic scoring (no paid AI required)
- Company, contact, lead, research, scoring and activity entities
- SQLite persistence and duplicate protection
- Dashboard, filters API and ranked Excel export
- CRM, AI and automation adapter boundaries for later phases
- Automated tests

## Windows quick start
1. Install Python 3.11 or 3.12. During installation select **Add Python to PATH**.
2. Extract the ZIP.
3. Double-click `run_windows.bat`.
4. Open `http://127.0.0.1:8000`. Swagger is at `http://127.0.0.1:8000/docs`.

The first run creates `.venv`, installs dependencies and starts the application.

## Import data
Run `python scripts/create_sample.py` for a template. Required columns:
`company_name,country,website,business_type,product_categories,imports_from_india,contact_name,contact_title,contact_email`

At `/docs`, run `POST /api/imports`. Keep `web_research=false` for fast/offline imports; turn it on only for a small reviewed batch. Download results from the dashboard or `GET /api/exports/leads.xlsx`.

## Qualification
Edit `config/qualification.yaml`. Default score: target country 15, importer/distributor 25, food/snack 25, imports from India 20, website 5, procurement contact 10. HIGH >=70, MEDIUM >=45.

## Future phases already bounded
- `app/integrations/ai.py`: local Ollama or paid model provider
- `app/integrations/automation.py`: n8n webhook/event publishing
- `app/integrations/crm.py`: internal CRM, Dynamics 365, HubSpot or Salesforce
- database entities separate companies, contacts, leads, research and activities

Before multi-user production, replace SQLite with PostgreSQL, add Alembic migrations, authentication/RBAC, encrypted secrets, background jobs and an approved enrichment provider. LinkedIn automation should remain human-approved and compliant with platform terms.
