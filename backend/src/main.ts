import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
require ('cors');


const mongoose = require('mongoose')
require('dotenv').config()

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(new ValidationPipe());
  app.enableCors({
    origin: 'http://localhost:3000', // Allow only this origin
    methods: ['GET', 'POST', 'READ', 'DELETE'], 
    credentials: true, // Allow credentials such as cookies
  });

  await app.listen(3000);
}
bootstrap(); 
