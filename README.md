
**Description:**
**
`	`High Peaks is an endless platformer game that uses your voice’s volume as the main controller for our main character, the ghost. The game uses a unique controller with a sound sensor on it that will read your voice level then make the ghost jump higher the louder you are.

The controller also comes with an array of LED’s showing the current noise level.

**System Description:**
**
`	`The controller contains two buttons, an LED array, and a sound sensor. The controller is connected to the computer via a USB connection and is powered by an Arduino Uno board. The two buttons ,the green and yellow buttons, are used for pause/go and reset ,respectively. The LED array contains 7 LEDs that acts like a visual meter to know the current volume level. The sound sensor is used to control the ghost on the screen to jump from platform to platform. The higher your volume the higher the ghost jumps. Processing in this project is used as the main game engine and it is also used to process information from the sensor and buttons and translate them into actions in the game.  

**Interaction model:**

![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.001.png)



**Circuit Diagram:**

![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.002.png)

**Challenges encountered:** The main challenge I faced was the discovery that I will not be able to transmit the information wirelessly from the controller to processing due to me buying the wrong bluetooth and wifi modules to experiment with. The main solution was to just abandon the wireless plan and use the regular USB serial connection.

` `**Final result:![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.003.png)![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.004.png)**

![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.005.png)

![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.006.png)

![](Aspose.Words.8504195c-24dc-43b5-a3f2-e4052f4ebc3c.007.png)

**Reflection:**

`	`Throughout this project I got to experiment with some ideas inside processing and inside the arduino environment and learned about a lot of modules and sensors that I could have added to the project. I liked the pace that I was taking while learning about these new modules and I found it really helpful that I took notes on every aspect of every sensor I have worked with to try and expand my knowledge in the world of arduino modules and sensors. If I were given additional time I would look at more alternate modules and boards to allow wireless communication between arduino and processing as well as find the libraries in processing that facilitate wireless connections.
