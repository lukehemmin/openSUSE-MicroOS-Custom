
# openSUSE MicroOS 커스텀 OS 제작 준비

## 1. openSUSE MicroOS 소스 코드 확보

openSUSE MicroOS의 소스 코드는 GitHub의 `openSUSE/microos-tools` 저장소에서 확보할 수 있습니다. 이 저장소에는 MicroOS를 빌드하고 관리하는 데 필요한 스크립트와 파일들이 포함되어 있습니다.

```bash
git clone https://github.com/openSUSE/microos-tools.git
```

## 2. 커스텀 OS 이미지 빌드 도구: KIWI NG

openSUSE MicroOS와 같은 Linux 시스템 어플라이언스를 빌드하는 데 사용되는 주요 도구 중 하나는 **KIWI NG**입니다. KIWI NG는 운영 체제 이미지를 생성하는 데 필요한 모든 정보를 포함하는 이미지 설명(Image Description) 파일을 기반으로 작동합니다. 이 이미지 설명 파일은 일반적으로 `config.xml` 또는 `.kiwi` 확장자를 가진 XML 파일입니다.

### KIWI NG의 주요 특징:

*   **어플라이언스 개념**: KIWI NG는 특정 사용 사례를 위해 미리 구성된 애플리케이션을 포함하는 운영 체제 이미지를 생성합니다. 이는 가상 머신 이미지, PXE 부팅 이미지, Vagrant 박스 등 다양한 형태로 제공될 수 있습니다.
*   **자동화된 이미지 생성**: 이미지 설명 파일만 있으면 사용자 상호 작용 없이 이미지 생성 프로세스가 자동화됩니다.
*   **다양한 사용 사례 지원**: 클라우드 환경, 커스텀 Linux 배포판, 라이브 시스템, 임베디드 시스템 등 다양한 환경에 맞는 이미지를 빌드할 수 있습니다.

### KIWI NG 설치 및 사용법

KIWI NG를 사용하여 openSUSE MicroOS 이미지를 빌드하려면 먼저 KIWI NG를 설치해야 합니다. openSUSE 환경에서는 다음 명령어를 사용하여 설치할 수 있습니다.

```bash
sudo zypper install kiwi-tools
```

다른 배포판의 경우 [KIWI NG 공식 문서](https://osinside.github.io/kiwi/installation.html)를 참조하여 설치할 수 있습니다.

KIWI NG를 사용하여 이미지를 빌드하는 기본적인 명령어는 다음과 같습니다.

```bash
kiwi-ng --debug system build --description <이미지_설명_파일_경로> --target-dir <출력_디렉토리>
```

예를 들어, `microos-tools` 저장소 내에 있는 이미지 설명 파일을 사용하여 빌드하려면 다음과 같이 할 수 있습니다.

```bash
kiwi-ng --debug system build --description /home/ubuntu/microos-tools/openSUSE-MicroOS.kiwi --target-dir /tmp/microos-build
```

**참고**: `openSUSE-MicroOS.kiwi` 파일은 `microos-tools` 저장소에 직접 포함되어 있지 않을 수 있습니다. 이 경우 openSUSE Build Service (OBS)에서 해당 파일을 찾아야 합니다. OBS는 openSUSE 프로젝트의 빌드 시스템으로, 다양한 openSUSE 이미지와 패키지의 빌드 정의를 포함하고 있습니다.

## 3. mkosi를 이용한 이미지 빌드

mkosi는 systemd 프로젝트에서 개발된 도구로, 다양한 Linux 배포판의 디스크 이미지를 생성하는 데 사용될 수 있습니다. KIWI NG와 유사하게, mkosi도 설정 파일을 기반으로 작동하며, openSUSE MicroOS 이미지를 빌드하는 데 활용될 수 있습니다.

mkosi에 대한 자세한 정보와 사용법은 [mkosi GitHub 저장소](https://github.com/systemd/mkosi) 또는 관련 문서를 참조하시기 바랍니다.

## 4. 개발 환경 설정

커스텀 OS를 제작하기 위한 개발 환경은 주로 다음을 포함합니다.

*   **Linux 운영 체제**: openSUSE, Ubuntu, Fedora 등 Linux 환경에서 빌드 도구를 실행하는 것이 일반적입니다.
*   **빌드 도구**: 위에서 언급된 KIWI NG 또는 mkosi.
*   **Git**: 소스 코드 관리 및 버전 관리를 위해 필요합니다.
*   **가상화 도구**: 빌드된 이미지를 테스트하기 위해 QEMU, VirtualBox, VMware 등의 가상화 소프트웨어가 필요할 수 있습니다.

### 추가 고려 사항:

*   **패키지 관리**: openSUSE의 경우 `zypper`를 사용하여 필요한 패키지를 설치하고 관리합니다.
*   **컨테이너 환경**: openSUSE MicroOS는 컨테이너 워크로드에 최적화되어 있으므로, Docker나 Podman과 같은 컨테이너 런타임에 대한 이해가 도움이 될 수 있습니다.
*   **불변성(Immutability)**: MicroOS는 불변성을 특징으로 하므로, 시스템 변경 사항을 관리하는 방식(예: `transactional-update`)에 대한 이해가 중요합니다.

이 가이드를 통해 openSUSE MicroOS 커스텀 OS 제작을 위한 기본적인 준비를 시작할 수 있습니다. 더 심화된 내용은 각 도구의 공식 문서를 참조하시거나, openSUSE 커뮤니티의 도움을 받는 것을 권장합니다.


