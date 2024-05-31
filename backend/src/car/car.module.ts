
import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AuthModule } from '../auth/auth.module';
import { CarController } from './car.controller';
import { CarService } from './car.service';
import { Car ,CarSchema } from './schemas/car.schema';


@Module({
  imports: [
    AuthModule,
    MongooseModule.forFeature([{ name: Car.name, schema: CarSchema }])
  ],
  controllers: [CarController],
  providers: [CarService],
})
export class CarModule {}