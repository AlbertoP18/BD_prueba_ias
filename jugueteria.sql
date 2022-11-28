/*
SQLyog Community v13.1.5  (32 bit)
MySQL - 10.4.19-MariaDB : Database - jugueteria_ap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jugueteria_ap` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `jugueteria_ap`;

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `cdad_codigo` int(10) NOT NULL,
  `cdad_nombre` varchar(20) NOT NULL,
  `dpto_codigo` int(10) NOT NULL,
  PRIMARY KEY (`cdad_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ciudades` */

insert  into `ciudades`(`cdad_codigo`,`cdad_nombre`,`dpto_codigo`) values 
(101,'Barranquilla',10),
(102,'Cartagena',20),
(103,'Santa Marta',30);

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `cl_id` int(12) NOT NULL,
  `cl_nombre` varchar(30) DEFAULT NULL,
  `cl_direccion` varchar(20) DEFAULT NULL,
  `cl_telefono` int(10) DEFAULT NULL,
  `cdad_codigo` int(10) DEFAULT NULL,
  `cl_sexo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `clientes` */

insert  into `clientes`(`cl_id`,`cl_nombre`,`cl_direccion`,`cl_telefono`,`cdad_codigo`,`cl_sexo`) values 
(123,'Natalia Bermudez','Cll 45 No 34-56',321474836,101,'F'),
(348,'Cecilia Ortiz','Cra 43 No 75-89',3435789,103,'F'),
(456,'Camilo Miranda','Cll 71B No 45-67',30024568,101,'M');

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `dpto_codigo` int(10) NOT NULL,
  `dpto_nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`dpto_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `departamentos` */

insert  into `departamentos`(`dpto_codigo`,`dpto_nombre`) values 
(10,'Atlantico'),
(20,'Bolivar'),
(30,'Magdalena');

/*Table structure for table `juguetes` */

DROP TABLE IF EXISTS `juguetes`;

CREATE TABLE `juguetes` (
  `jug_codigo` int(10) NOT NULL,
  `jug_descripcion` varchar(30) DEFAULT NULL,
  `jug_valor` int(10) DEFAULT NULL,
  `jug_cantidad` int(10) DEFAULT NULL,
  `jug_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`jug_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `juguetes` */

insert  into `juguetes`(`jug_codigo`,`jug_descripcion`,`jug_valor`,`jug_cantidad`,`jug_tipo`) values 
(1,'parques',2000,50,'mesa'),
(2,'movil ',7000,4,'didactico');

/*Table structure for table `vendedores` */

DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE `vendedores` (
  `vd_id` int(12) NOT NULL,
  `vd_nombre` varchar(20) NOT NULL,
  `vd_direccion` varchar(20) NOT NULL,
  `vd_telefono` int(10) NOT NULL,
  `cdad_codigo` int(10) NOT NULL,
  PRIMARY KEY (`vd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `vendedores` */

insert  into `vendedores`(`vd_id`,`vd_nombre`,`vd_direccion`,`vd_telefono`,`cdad_codigo`) values 
(54,'Luis Mercado','Cra 34 No 56-87',8934567,102),
(55,'Carla Gonzalez','Cll 56 No 24-68',3245678,103),
(56,'Andrea Ruiz','Cra 78 No 34-23',356789,101),
(57,'Maria Josefa','Cra 22 No 35-31',2552697,101);

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `vtas_codigo` int(10) NOT NULL,
  `cl_id` int(12) DEFAULT NULL,
  `vd_id` int(10) DEFAULT NULL,
  `jug_codigo` int(10) DEFAULT NULL,
  `vtas_cant_vend` int(10) DEFAULT NULL,
  `vtas_valor` double DEFAULT NULL,
  `vtas_fecha` date DEFAULT NULL,
  PRIMARY KEY (`vtas_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ventas` */

insert  into `ventas`(`vtas_codigo`,`cl_id`,`vd_id`,`jug_codigo`,`vtas_cant_vend`,`vtas_valor`,`vtas_fecha`) values 
(1,123,54,2,10,7000,'2018-06-23'),
(2,456,55,1,3,5000,'2020-06-02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
