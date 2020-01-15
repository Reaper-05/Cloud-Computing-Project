FROM python:alpine3.7
COPY ./src/tweet_collector /app
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN chmod +x ./src/tweet_collector/collect_sin_streaming.py
RUN python3 -m textblob.download_corpora
CMD python3 /app/src/tweet_collector/collect_sin_streaming.py "http://SinsOnTwitter:group68@172.26.38.38:5984/" "SinsOnTwitter" "group68" "tweet_database" "index_database"
