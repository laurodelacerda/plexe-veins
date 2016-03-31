//
// Copyright (C) 2012-2016 Michele Segata <segata@ccs-labs.org>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package org.car2x.veins.modules.application.platooning.scenarios;

import org.car2x.veins.modules.application.platooning.scenarios.BaseScenario;

simple AccelerateAndBrakeScenario like BaseScenario
{
    parameters:

        //average speed
        double leaderSpeed @unit("kmph") = default(100kmph);
        //braking deceleration
        double brakingDeceleration @unit("mpsps") = default(4mpsps);
        //acceleration deceleration
        double acceleration @unit("mpsps") = default(4mpsps);
        //start accelerating at time
        double startAccelerating @unit("s") = default(5s);
        //start braking at time
        double startBraking @unit("s") = default(30s);

        //base scenario inherited parameters
        //controller used by followers
        string controller;
        //list of various controller parameters
        //headway time to be used for the ACC
        double accHeadway @unit("s") = default(1.2s);
        //headway time for leaders using ACC
        double leaderHeadway @unit("s") = default(1.2s);
        //cacc and engine related parameters
        double caccXi = default(1);
        double caccOmegaN @unit("Hz") = default(0.2Hz);
        double caccC1 = default(0.5);
        double engineTau @unit("s") = default(0.5s);
        double ploegH @unit("s") = default(0.5s);
        double ploegKp = default(0.2);
        double ploegKd = default(0.7);

        //enable/disable the realistic engine model
        bool useRealisticEngine = default(false);
        //vehicle type for the realistic engine model
        string vehicleType = default("");

        int headerLength @unit("bit") = default(0bit);

        @display("i=block/app2");
        @class(AccelerateAndBrakeScenario);

    gates:
        input lowerLayerIn; // from network layer
        output lowerLayerOut; // to network layer
        input lowerControlIn; // control from network layer
        output lowerControlOut; // control to network layer

}