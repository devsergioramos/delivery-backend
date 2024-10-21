from sqlmodel import Field, SQLModel


class Restaurantes(SQLModel, table=True):
    id: int = Field(primary_key=True)
    name: str
    desc: str
