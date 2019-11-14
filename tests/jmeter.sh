#!/usr/bin/env bash

# Вы можете как угодно редактировать этот скрипт, настраивать параметры запуска Apache JMeter, пробрасывать переменные
# окружения из сборки и т.п.

# Ваша задача: добиться, чтобы при локальном исполнении данного скрипта источник нагрузки успешно отработал и
# все нужные файлы с отчётами сформировались в каталоге ./public в корне репозитория (конечно, если вы планируете
# использовать GitLab Pages для публикации отчётов).

# Для удобства строку запуска jmeter можно параметризовать и вынести параметры в переменные окружения пайплайна.

# В примере ниже отчёт сначала формируется в каталоге ./jmeter_report,
# а затем в шаблоне .gitlab-ci.yml в job-е pages он копируется в ./public.


echo "INFO - Some JMeter prepare steps..."
ls -la

echo "DEBUG - Working directory: $1"
echo "INFO - Running JMeter..."
jmeter -n -t tests/example-jmeter-test.jmx -Jhost=ya.ru -l index.html -e -o ./jmeter_report

echo "DEBUG - Some steps to prepare reports..."

echo "DEBUG - view files in ./jmeter_report:"
ls -la ./jmeter_report
echo "INFO - Report's data files are prepared to publish"