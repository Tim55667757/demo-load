#!/usr/bin/env bash

# Вы можете как угодно редактировать этот скрипт, настраивать параметры запуска Yandex.Tank, пробрасывать переменные
# окружения из сборки и т.п.

# Ваша задача: добиться, чтобы при локальном исполнении данного скрипта источник нагрузки успешно отработал и
# все нужные файлы с отчётами сформировались в каталоге ./public в корне репозитория (конечно, если вы планируете
# использовать GitLab Pages для публикации отчётов).

# Для удобства строку запуска Yandex.Tank можно параметризовать и вынести параметры в переменные окружения пайплайна.

# Помните, что по умолчанию Yandex.Tank не генерирует html-отчеты! Предполагается, что он будет интегрирован
# с InfluxDB и Grafana: https://yandextank.readthedocs.io/en/latest/core_and_modules.html#influxdb

# В примере ниже фейковый html-отчёт сначала формируется в каталоге ./yandextank_report,
# а затем в шаблоне .gitlab-ci.yml в job-е pages он копируется в ./public.

# На самом деле, после запуска тестов вы увидите только логи Yandex.Tank в консоли. Для подключения экспорта отчётов
# в свою InfluxDB и сервис Grafana, посмотрите пример в файле example-yandextank-test.yml, секция "influx".


echo "INFO - Some Yandex.Tank prepare steps..."
ls -la

echo "INFO - Running Yandex.Tank..."
yandex-tank -c tests/example-yandextank-test.yml tests/ammo.txt

echo "DEBUG - Some steps to prepare reports..."
mkdir yandextank_report
echo 'Fake Yandex.Tank example of test report.<br>Your must exporting Yandex.Tank report to Grafana.<br><br>See instruction <a href="https://yandextank.readthedocs.io/en/latest/core_and_modules.html#influxdb">here</a>' > ./yandextank_report/index.html
echo "INFO - Report's data files are prepared to publish"