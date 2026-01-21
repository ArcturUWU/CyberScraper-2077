# Обновления и запуск CyberScraper-2077

## Что исправлено
- Обновлены импорты LangChain (prompt template, text splitter), убрана устаревшая база моделей.
- Добавлены принудительные стили/JS для раскрытия сайдбара и inline-блок выбора модели + Refresh Ollama Models, если сайдбар скрыт.
- Исправлен вывод JSON: кириллица и прочие Unicode выводятся без `\uXXXX`, prettify с отступами.
- Скрипт `run_streamlit.bat` для удобного старта в `.venv`.
- Playwright и зависимости ставятся в локальную виртуалку, Ollama поддерживает модель `gpt-oss:20b`.

## Быстрый старт (локально)
1) Python 3.10+ установлен. В корне проекта:
   ```cmd
   python -m venv .venv
   .venv\Scripts\python -m pip install --upgrade pip
   .venv\Scripts\python -m pip install -r requirements.txt
   .venv\Scripts\python -m playwright install chromium
   ```
2) Запуск Streamlit (порт по умолчанию 8501):
   ```cmd
   run_streamlit.bat
   ```
   Если 8501 занят, временно запустите на другом порту:
   ```cmd
   .venv\Scripts\python -m streamlit run main.py --server.port 8502 --server.headless true
   ```
3) Ollama:
   - Установить Ollama и запустить `ollama serve`.
   - Скачать модель:
     ```cmd
     ollama pull gpt-oss:20b
     ```
   - В UI нажать “Refresh Ollama Models” и выбрать `ollama:gpt-oss:20b`.

## Проверка
- Откройте `http://localhost:8501` (или `:8502`, если так запускали).
- Вверху страницы есть секция “Model & Controls” (fallback, если сайдбар скрыт), где можно выбрать модель и обновить список Ollama.
- При выводе JSON кириллица должна отображаться нормально.

## Полезные команды
- Остановка фоновых процессов Streamlit:
  ```cmd
  Get-Process python,streamlit | Stop-Process -Force
  ```
- Тест Ollama:
  ```cmd
  Invoke-RestMethod -Method Post -Uri http://localhost:11434/api/generate -ContentType application/json -Body '{\"model\":\"gpt-oss:20b\",\"prompt\":\"ping\"}'
  ```

## На заметку
- Файл `.venv` не коммитить.
- Порт 8501 может быть занят другими процессами; используйте 8502 при необходимости.
