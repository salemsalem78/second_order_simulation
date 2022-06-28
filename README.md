# Simulation of a second order system
A matlab project with a GUI to demonstrate effects of modifying the gain, dampening factor, and natural frequency.
## Initialization
In the `InitiateData.m` file, the following `Data` properties may be modified:
1. `time_step_size`: Time difference between two calculations
2. `time`: The start and stop times
3. `K`: Initial value for the gain
4. `zeta`: Initial value for dampening factor
5. `omega`: Initial value for the natural frequency
NOTE: Do not modify the other parameters as they might affect the app upon starting

# Running the app
In the matlab command window, type: `SecondOrderSimulation`. the below GUI will appear.

![image](https://user-images.githubusercontent.com/6416943/176255804-80eaf0ea-5d74-4147-a8f7-5660feff0c60.png)

Clicking `start` will start the simulation. The axis displays two line plots. The green plot is the desired value, the blue plot is the current value. Clicking anywhere on the axis will register the `Y` location of the click and set the desired value to that location.

![image](https://user-images.githubusercontent.com/6416943/176256409-3dcd76cd-6fe9-4a6d-aed5-3105dc821bd2.png)

The current value will follow the desired value as per the system parameters

## Updating the parameters

The left panel displays current values for gain  $ K $, dampening factor  $ \zeta $, and natural frequency  $ \omega $. When updating parameters, you must click on `Update` for the changes to take effect

![image](https://user-images.githubusercontent.com/6416943/176256848-349a2f8b-8eea-4648-9896-4780ce36862f.png)

## Theory
A second order system has the following transfer function:
$$ H = K \frac{1}{s^2+2\zeta \omega s+\omega^2} $$


- $\zeta$  is the dampening effect, where $0 \leq \zeta$
- $K$ is the system gain
- $\omega$ is the natural frequency of the system

## Sample output

![image](https://user-images.githubusercontent.com/6416943/176263302-306d1fd8-cab8-4d93-879c-a34fcb1faf39.png)

