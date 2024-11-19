FROM python:3
WORKDIR /usr/src/app
COPY Pipfile ./
# fix for ModuleNotFoundError: No module named 'pipenv.vendor.urllib3.packages.six.moves'
RUN pip install requests --upgrade
RUN pip install urllib3 --upgrade
RUN pip install boto3 --upgrade
RUN pip install django-storages --upgrade
RUN pip install django --upgrade

RUN pip install --no-cache-dir pipenv==2020.11.15 && pipenv install
COPY app.py .
COPY tests.py .
CMD [ "pipenv", "run", "python", "-m", "flask", "run", "--host=0.0.0.0" ]
