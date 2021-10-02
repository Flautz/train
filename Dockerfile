FROM flautz/pytorch

COPY . /app
WORKDIR /app

CMD ./train_alphazero
