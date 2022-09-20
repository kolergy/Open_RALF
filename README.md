# Open_RALF
Hardware platform and base software for an autonomous indor service trolley. The aim is to provide a usefull service in a FabLab or a workshop while being a mean to democratise autonomous technologies.

Plateforme physique et base de code pour un desserte de service autonome. L'objectif est de fournir un service utile pour un FabLab ou un atelier tout en permetant de democratiser les technologies liées a l'autonomie. 

The design of the carrier system has been made around an IKEA BROR trolley and hoover board wheel motors and drivers.

La conception de la plateforme physique est faite sur une base de desserte IKEA BROR et drvrait pouvoir etre adapté sans trop de travail a d'autre base de desserte de structure similaire. 
 - Propulsion      : 2 x roues motorisées de hoover board et drivers associés.
 - Micro controleur: 1 x ESP32 Lolin D32 Pro
 - AI              : 1 x Nvidia Jetson Nano / Jetson Xavier 
 - Securité        : 1 x Arret d'urgence coup de poing
 - Video           : 2 x Cameras 1080p
 - IMU             : 1 x 9 DOF modele TBD
 - Anti colision   : 
    - 6 x TOF 
    - 4 x Ultrasound
    - 4 x Moustaches

Le projet a pour but de developer la plateforme physique ainsi qu'une plateforme software de base permetant des fonctions simples 
