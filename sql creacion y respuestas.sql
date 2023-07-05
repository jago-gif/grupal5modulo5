
create schema telovendo2;
CREATE USER 'adminvendo'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON telovendo2.* TO 'adminvendo'@'localhost';
FLUSH PRIVILEGES;

use telovendo2;

create table usuarios (
id_usuario int primary key not null auto_increment,
nombre varchar(50),
apellido varchar(50),
contrasena  varchar(50),
zona_horaria  varchar(50) DEFAULT "UTC-3",
genero varchar(10),
telefono_contacto varchar(15)
);


create table ingresos (
id_ingreso int primary key not null auto_increment,
id_usuario int,
fecha_hora_ingreso DATETIME default current_timestamp,
FOREIGN KEY (id_usuario) references usuarios(id_usuario)
);

alter table usuarios
MODIFY zona_horaria varchar(50) DEFAULT "UTC-2";

INSERT INTO usuarios ( nombre, apellido, contrasena, genero, telefono_contacto)
VALUES
  ( 'John', 'Doe', '123456', 'Masculino', '123456789'),
  ( 'Jane', 'Smith', 'abcdef', 'Femenino', '987654321'),
  ( 'Mike', 'Johnson', 'qwerty', 'Masculino', '456789123'),
  ( 'Emily', 'Davis', 'password', 'Femenino', '789123456'),
  ( 'David', 'Wilson', 'abc123', 'Masculino', '654321789'),
  ( 'Sarah', 'Anderson', 'password123', 'Femenino', '321987654'),
  ( 'Michael', 'Brown', '987654321', 'Masculino', '159753486'),
  ( 'Jessica', 'Taylor', 'qwerty123', 'Femenino', '486753159');


INSERT INTO ingresos (id_usuario) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (1),
  (2);
  
  -- Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
  -- telefono_contacto y genero son 2 campos que podrían estár distintos telefono podría ser int si son solo nacionales y genero podría ser un char para definir m o f solamente.
  
  create table contactos (
  id_contactos int primary key not null auto_increment,
  id_usuario int,
  telefono varchar(15),
  correo_electronico varchar(50),
  FOREIGN KEY (id_usuario) references usuarios(id_usuario)
  );
  
  alter table usuarios drop column telefono_contacto;
  
  
