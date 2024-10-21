from fastapi import FastAPI

from sqlmodel import Session

from app.database import create_db_and_tables, engine
from app.models import Restaurantes

app = FastAPI()


@app.on_event("startup")
def on_startup():
    create_db_and_tables()


@app.get("/")
def root():
    return {"message": "Hello World"}


@app.post("/restaurantes/")
def create_restaurante(restaurante: Restaurantes):
    with Session(engine) as session:
        session.add(restaurante)
        session.commit()
        session.refresh(restaurante)
        return restaurante


@app.get("/restaurantes/")
def listar_restaurantes():
    with Session(engine) as session:
        restaurantes = session.query(Restaurantes).all()
        return restaurantes
