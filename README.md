<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="https://raw.githubusercontent.com/knu-sunshine/.github/fab105dbeebc68d380808fcd844568bb62ebc5a5/profile/logo_text.svg" alt="Logo" style="width: 50%;">

  <h3 align="center">Mr. Sunshine</h3>

  <p align="center">
    Smart home app & server solution for lighting, curtain control, sunrise/sunset tracking, and automated environment-based controls.
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>🗂️ Table of Contents 🗂️</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#specifications">Specifications</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage-screenshot">Usage Screenshot</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<p align="center" style="display: flex; justify-content: space-between;"></p>


### Background
With the recent development of smart home technology, it has become possible to effectively manage and automate lighting and curtain systems in the home. More and more users want to utilize these technologies for a more convenient life. In addition, there is a growing interest in environmental and energy conservation, and there is a growing need for an automatic control system to support it.

### Project Objectives and Scope
The Mr. Sunshine project encompasses the following key functionalities:

- **Login:** Users can log in to the app using their Google accounts.

- **Sunrise and Sunset Time Check:** Users can conveniently check sunrise and sunset times on the initial screen.

- **Room Registration:** Users have the ability to register rooms, which can contain various devices such as LED lights, curtains, and light sensors.

- **Device Registration:** Multiple devices can be registered within each room.

- **Device Control:** Users can register and control LED devices, adjusting brightness from 0 (off) to 100 (maximum brightness). Similarly, curtain devices can be registered and controlled, managing the curtain openness from 0 (closed) to 100 (fully open).

- **Room-Wide Device Control:** Users can control all registered control-related devices (LED lights and curtains) within a room collectively.

- **Auto Mode:** Auto mode relies on light sensors (minimum one for LED, curtain, and light) that periodically send light sensor values to the server. The server then compares these values with predefined thresholds. If the light sensor value falls below or exceeds the threshold, the server automatically adjusts the registered devices (LED lights and curtains) within the room to match the desired light level, aligning it with the predefined threshold.

This project uses IoT devices (LED, curtains, sensors) and MQTT for device control and sensor data transmission, while user-server interactions occur over HTTP. The server handles user control requests, AUTO mode, and device registrations, controlling IoT devices through MQTT.


### Tech Stack

| Category | Technology |
|----------|------------|
| Application | [![Flutter][Flutter]][Flutter-url][![Dart][Dart]][Dart-url][![Figma][Figma]][Figma-url] |
| Server | [![Nodejs][Nodejs]][Nodejs-url][![Express][Express]][Express-url][![npm][npm]][npm-url][![JavaScript][JavaScript.js]][JavaScript-url][![MQTT][MQTT]][MQTT-url] |
| Deployment | [![Amazon_AWS][Amazon_AWS]][Amazon_AWS-url][![Amazon_EC2][Amazon_EC2]][Amazon_EC2-url][![Firebase][Firebase]][Firebase-url] |
| Database | [![MongoDB][MongoDB]][MongoDB-url] |
| IoT Device | [![Raspberry][Raspberry]][Raspberry-url][![Ubuntu][Ubuntu]][Ubuntu-url][![Python][Python.org]][Python-url][![MQTT][MQTT]][MQTT-url] |
| Development Environment | [![macOS][macOS]][macOS-url][![Window][Window]][Window-url][![Linux][Linux]][Linux-url] |
| Collaborative Software | [![Git][Git]][Git-url][![GitHub][GitHub]][GitHub-url][![Notion][Notion]][Notion-url][![Skype][Skype]][Skype-url][![KakaoTalk][KakaoTalk]][KakaoTalk-url] | 


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!--SPECIFICATIONS-->
# Specifications

### Development Environment Specifications
Our project was developed in an Apple Silicon environment, which provided us with advanced computing capabilities and efficiency. Here are the details:

- **Platform**: Apple Silicon (M1, M1 Pro, M1 Max, or later)
- **Operating System**: macOS Big Sur or later
- **Memory**: 8GB RAM or more
- **Storage**: 256GB SSD or higher

We recommend using a similar Apple Silicon-based environment for development to ensure compatibility

### Hardware Requirements for Client Device

For setting up the client device in this project, you will need the following hardware components:

- **Raspberry Pi 4 4GB**(+@): The core computing unit for the kiosk.
- **MicroSD Card with webOS Image**: Use a microSD card loaded with the webOS image to boot the Raspberry Pi. For this project, we have used the pre-built webOS OSE 2.24.0 image for Raspberry Pi 4, which can be downloaded from [here](https://github.com/webosose/build-webos/releases/tag/v2.24.0). Additionally, if you need guidance on flashing the webOS Open Source Edition to your microSD card, please refer to [flashing webos-ose guide](https://www.webosose.org/docs/guides/setup/flashing-webos-ose/) for detailed instructions.
- **Touchscreen or Monitor**: A display unit to interact with the kiosk. A touchscreen is preferred for a more interactive experience.<br/> we use [this](https://www.icbanq.com/P009842845)
- **Webcam**: An essential component for facial recognition or other interactive features. Ensure compatibility with the Raspberry Pi.
- **Optional Input Devices**: Devices like a mouse and keyboard for initial setup and troubleshooting.
- **Power Supply and Cables**: A suitable power supply for the Raspberry Pi and screen, along with necessary cables such as HDMI for connectivity.


Ensure that you have all these components available before proceeding with the setup of your client device for the signage solution project.


> [webOS Offitial Docs](https://www.webosose.org/docs/guides/setup/system-requirements/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
# Getting Started

This guide will help you set up and run the project in your local environment. Follow these steps to get started.

> **Note:** This guide is tailored for a setup on **a single local PC**. It can also be adapted for multi-server environments, accommodating both centralized and distributed systems efficiently.

> **Note:** For effective data processing, we recommend hosting both the **Flask application and database on the same system**. This setup reduces latency and improves operational efficiency, especially for large, user-specific models.

## Installation

The process for installing and setting up the project is as follows. This template does not rely on any external dependencies or services.

1. Clone the repository.
   ```sh
   git clone https://github.com/knu-sunshine/mr_sunshine_client.git
   ```
2. Move into the cloned directory.
   ```sh
   cd mr_sunshine_client
   ```

### Prerequisites
Before proceeding, ensure that you have:
✅ Flutter SDK installed (Installation Guide)
✅ A device/emulator set up for testing (Android, iOS, or WebOS)

### Project Setup Order
Since this project only requires the Flutter frontend, proceed directly to the Flutter setup.

Running the Flutter Application
1. Install Dependencie
```sh
  flutter pub get
```
3. Run the App in Debug Mode
```sh
  flutter run
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage Screenshot 

### Main Page
<div style="display:flex">
  <img width="20%" alt="Main Page after sunrise" src="https://github.com/user-attachments/assets/7d79270b-b183-4095-b775-0914da45c40f">
  <img width="20%" alt="Main Page after sunset" src="https://github.com/user-attachments/assets/4768006f-d17f-49ab-a805-6c1256f0ecfc">
</div>
This is the main page of the service. You can add rooms you want to manage and control all room settings.

### Room Page
<div style="display:flex">
  <img width="20%" alt="Room Page device off" src="https://github.com/user-attachments/assets/9675c0f8-2886-40d8-878f-05f5f5a71bca">
  <img width="20%" alt="Room Page device on" src="https://github.com/user-attachments/assets/3f1cd76a-4891-47c9-be50-6a2769c84ea8">
  <img width="20%" alt="Room Page auto mode" src="https://github.com/user-attachments/assets/4b3562a2-4f94-4f2d-ab7c-c7858a04fa9b">
</div>
This is the page for controlling the room's IoT devices. You can register IoT devices and manage them within a single room. Adjust the brightness to your desired level or enable 'Auto' mode to automatically set it based on the sunlight.

### Room Page Modals
<div style="display:flex">
  <img width="20%" alt="device setting modal" src="https://github.com/user-attachments/assets/0845f128-4b93-4c51-b854-24efdc614840">
  <img width="20%" alt="device info modal" src="https://github.com/user-attachments/assets/35c4eece-a7b9-483b-8a83-faef796f3a4a">
</div>
These are the modals that can be opened on the room page. You can adjust the brightness of each device or check its information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/noFlowWater/signage_solution.svg?style=for-the-badge
[contributors-url]: https://github.com/noFlowWater/signage_solution/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/noFlowWater/signage_solution.svg?style=for-the-badge
[forks-url]: https://github.com/noFlowWater/signage_solution/network/members
[stars-shield]: https://img.shields.io/github/stars/noFlowWater/signage_solution.svg?style=for-the-badge
[stars-url]: https://github.com/noFlowWater/signage_solution/stargazers
[issues-shield]: https://img.shields.io/github/issues/noFlowWater/signage_solution.svg?style=for-the-badge
[issues-url]: https://github.com/noFlowWater/signage_solution/issues
[license-shield]: https://img.shields.io/github/license/noFlowWater/signage_solution.svg?style=for-the-badge
[license-url]: https://github.com/noFlowWater/signage_solution/blob/master/LICENSE.txt

[Flutter]: https://img.shields.io/badge/Flutter-02569B.svg?style=for-the-badge&logo=Flutter&logoColor=white
[Flutter-url]: https://flutter.dev/

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com

[Figma]: https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=fff
[Figma-url]: https://www.figma.com/

[Express]: https://img.shields.io/badge/Express-000000.svg?style=for-the-badge&logo=Express&logoColor=white
[Express-url]: https://expressjs.com/

[Raspberry]: https://img.shields.io/badge/Raspberry%20Pi-A22846.svg?style=for-the-badge&logo=Raspberry-Pi&logoColor=white
[Raspberry-url]: https://www.raspberrypi.com/

[Nodejs]: https://img.shields.io/badge/Node.js-393?style=for-the-badge&logo=nodedotjs&logoColor=fff
[Nodejs-url]: https://nodejs.org/en

[npm]: https://img.shields.io/badge/npm-CB3837.svg?style=for-the-badge&logo=npm&logoColor=white
[npm-url]: https://www.npmjs.com/

[MQTT]: https://img.shields.io/badge/MQTT-660066.svg?style=for-the-badge&logo=MQTT&logoColor=white
[MQTT-url]: https://mqtt.org/

[Dart]: https://img.shields.io/badge/Dart-0175C2.svg?style=for-the-badge&logo=Dart&logoColor=white
[Dart-url]: https://dart.dev/

[MongoDB]: https://img.shields.io/badge/MongoDB-47A248.svg?style=for-the-badge&logo=MongoDB&logoColor=white
[MongoDB-url]: https://www.mongodb.com/

[Python.org]: https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white
[Python-url]: https://www.python.org/

[JavaScript.js]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[JavaScript-url]: https://developer.mozilla.org/ko/docs/Learn/JavaScript

[LG]: https://img.shields.io/badge/webOS-A50034?style=for-the-badge&logo=lg&logoColor=fff
[LG-url]: https://www.webosose.org/

[Raspberry]: https://img.shields.io/badge/Raspberry%20Pi-A22846?style=for-the-badge&logo=raspberrypi&logoColor=fff
[Raspberry-url]: https://www.raspberrypi.com/

[macOS]: https://img.shields.io/badge/macOS-000?style=for-the-badge&logo=macOS&logoColor=fff
[macOS-url]: https://support.apple.com/ko-kr/macOS

[Window]: https://img.shields.io/badge/Windows-0078D4.svg?style=for-the-badge&logo=Windows&logoColor=white
[Window-url]: https://www.microsoft.com/en-in/windows?r=1

[Notion]: https://img.shields.io/badge/Notion-000000.svg?style=for-the-badge&logo=Notion&logoColor=white
[Notion-url]: https://www.notion.so/

[Skype]: https://img.shields.io/badge/Skype-00AFF0.svg?style=for-the-badge&logo=Skype&logoColor=white
[Skype-url]: https://skype.com/

[GitHub]: https://img.shields.io/badge/GitHub-181717.svg?style=for-the-badge&logo=GitHub&logoColor=white
[GitHub-url]: https://github.com/

[Git]: https://img.shields.io/badge/Git-F05032.svg?style=for-the-badge&logo=Git&logoColor=white
[Git-url]: https://git-scm.com/

[Ubuntu]: https://img.shields.io/badge/Ubuntu-E95420.svg?style=for-the-badge&logo=Ubuntu&logoColor=white
[Ubuntu-url]: https://ubuntu.com/

[Linux]: https://img.shields.io/badge/Linux-FCC624.svg?style=for-the-badge&logo=Linux&logoColor=black
[Linux-url]: https://www.linux.org/

[Firebase]: https://img.shields.io/badge/Firebase-FFCA28.svg?style=for-the-badge&logo=Firebase&logoColor=black
[Firebase-url]: https://firebase.google.com/

[Amazon_AWS]: https://img.shields.io/badge/Amazon%20AWS-232F3E.svg?style=for-the-badge&logo=Amazon-AWS&logoColor=white
[Amazon_AWS-url]: https://aws.amazon.com/

[Amazon_EC2]: https://img.shields.io/badge/Amazon%20EC2-FF9900.svg?style=for-the-badge&logo=Amazon-EC2&logoColor=white
[Amazon_EC2-url]: https://aws.amazon.com/ec2/

[KakaoTalk]: https://img.shields.io/badge/KakaoTalk-FFCD00.svg?style=for-the-badge&logo=KakaoTalk&logoColor=black
[KakaoTalk-url]: https://www.kakaocorp.com/page/service/service/KakaoTalk
