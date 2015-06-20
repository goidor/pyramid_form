from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    Unicode,
    UnicodeText,
    )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    )

from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()


def initialize_sql(engine):
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    Base.metadata.create_all(engine)


class Person(Base):
    __tablename__ = 'persons'
    id = Column(Integer, primary_key=True)
    nombre = Column(Unicode(200), nullable=False)
    apellido = Column(Unicode(200))
    correo = Column(Unicode(200))
    telefono = Column(Integer)
    direccion = Column(UnicodeText)

#Index('my_index', MyModel.name, unique=True, mysql_length=255)
