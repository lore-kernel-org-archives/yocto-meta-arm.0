Subject: Re: [PATCH] arm-bsp/n1sdp: add board firmware recipe and documentation
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:54:30 -0700
References: <20201014114801.32608-1-kamil.dziezyk@arm.com>
In-Reply-To: <20201014114801.32608-1-kamil.dziezyk@arm.com>
Message-ID: <13419.1602676470843239886@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 12:48 PM, Kamil Dziezyk wrote:

>
> board-firmware:
>  * updates scp binaries
>  * Custom license - STM-SLA0044-Rev5 - added in layer.conf,
>    whitelisted in n1sdp.conf.
>=20
> firmware-image:
>  * Combines uefi, tf-a and scp binaries into a tarball.
>  * There are 2 flavours available:
>    - n1sdp-board-firmware_primary.tar.gz
>    - n1sdp-board-firmware_secondary.tar.gz
>=20
> Change-Id: I82d0c995956310a569b27431f98f7c21accf8330
> Issue-Id: SCM-1508
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/layer.conf                  |  3 +
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  5 ++
>  meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 | 18 +++++
>  meta-arm-bsp/documentation/n1sdp.md           | 64 +++++++++++++++
>  .../images/board-firmware-n1sdp_2020.07.27.bb | 53 ++++++++++++
>  .../images/sdcard-image-n1sdp_0.1.bb          | 80 +++++++++++++++++++
>  6 files changed, 223 insertions(+)
>  create mode 100644 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
>  create mode 100644 meta-arm-bsp/documentation/n1sdp.md
>  create mode 100644
> meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0=
.1.bb
>=20
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 816ff9d..4214132 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
>  
>  LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
>  LAYERSERIES_COMPAT_meta-arm-bsp =3D "dunfell gatesgarth"
> +
> +# Additional license directories.
> +LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 9df3e50..8d143fe 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -38,3 +38,8 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
>  #grub-efi
>  EFI_PROVIDER ?=3D "grub-efi"
>  MACHINE_FEATURES +=3D "efi"
> +
> +# SD-Card firmware
> +# Board firmware prebuilts are shared under custom license
> +LICENSE_FLAGS_WHITELIST +=3D "stm-sla0044"
> +EXTRA_IMAGEDEPENDS +=3D "sdcard-image-n1sdp"
> diff --git a/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
> b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
> new file mode 100644
> index 0000000..edb5cd5
> --- /dev/null
> +++ b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
> @@ -0,0 +1,18 @@
> +SLA0044 Rev5/February 2018
> +
> +BY INSTALLING COPYING, DOWNLOADING, ACCESSING OR OTHERWISE USING THIS
> SOFTWARE OR ANY PART THEREOF (AND THE RELATED DOCUMENTATION) FROM
> STMICROELECTRONICS INTERNATIONAL N.V, SWISS BRANCH AND/OR ITS AFFILIATED
> COMPANIES (STMICROELECTRONICS), THE RECIPIENT, ON BEHALF OF HIMSELF OR
> HERSELF, OR ON BEHALF OF ANY ENTITY BY WHICH SUCH RECIPIENT IS EMPLOYED =
AND/OR
> ENGAGED AGREES TO BE BOUND BY THIS SOFTWARE LICENSE AGREEMENT.
> +
> +Under STMicroelectronics=E2=80=99 intellectual property rights, the red=
istribution,
> reproduction and use in source and binary forms of the software or any p=
art
> thereof, with or without modification, are permitted provided that the
> following conditions are met:
> +1.	Redistribution of source code (modified or not) must retain any copy=
right
> notice, this list of conditions and the disclaimer set forth below as it=
ems 10
> and 11.
> +2.	Redistributions in binary form, except as embedded into microcontrol=
ler or
> microprocessor device manufactured by or for STMicroelectronics or a sof=
tware
> update for such device, must reproduce any copyright notice provided wit=
h the
> binary code, this list of conditions, and the disclaimer set forth below=
 as
> items 10 and 11, in documentation and/or other materials provided with t=
he
> distribution.
> +3.	Neither the name of STMicroelectronics nor the names of other contri=
butors
> to this software may be used to endorse or promote products derived from=
 this
> software or part thereof without specific written permission.
> +4.	This software or any part thereof, including modifications and/or
> derivative works of this software, must be used and execute solely and
> exclusively on or in combination with a microcontroller or microprocesso=
r
> device manufactured by or for STMicroelectronics.
> +5.	No use, reproduction or redistribution of this software partially or
> totally may be done in any manner that would subject this software to an=
y Open
> Source Terms. =E2=80=9COpen Source Terms=E2=80=9D shall mean any open so=
urce license which
> requires as part of distribution of software that the source code of suc=
h
> software is distributed therewith or otherwise made available, or open s=
ource
> license that substantially complies with the Open Source definition spec=
ified
> at www.opensource.org and any other comparable open source license such =
as for
> example GNU General Public License (GPL), Eclipse Public License (EPL), =
Apache
> Software License, BSD license or MIT license.
> +6.	STMicroelectronics has no obligation to provide any maintenance, sup=
port
> or updates for the software.
> +7.	The software is and will remain the exclusive property of
> STMicroelectronics and its licensors. The recipient will not take any ac=
tion
> that jeopardizes STMicroelectronics and its licensors' proprietary right=
s or
> acquire any rights in the software, except the limited rights specified
> hereunder.
> +8.	The recipient shall comply with all applicable laws and regulations
> affecting the use of the software or any part thereof including any appl=
icable
> export control law or regulation.
> +9.	Redistribution and use of this software or any part thereof other th=
an as
> permitted under this license is void and will automatically terminate yo=
ur
> rights under this license.=20
> +10.	THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "A=
S IS"
> AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT LIM=
ITED
> TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
> PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS=
,
> WHICH ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT=
 SHALL
> STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
 NOT
> LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DA=
TA, OR
> PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTW=
ARE,
> EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +11.	EXCEPT AS EXPRESSLY PERMITTED HEREUNDER, NO LICENSE OR OTHER RIGHTS=
,
> WHETHER EXPRESS OR IMPLIED, ARE GRANTED UNDER ANY PATENT OR OTHER INTELL=
ECTUAL
> PROPERTY RIGHTS OF STMICROELECTRONICS OR ANY THIRD PARTY.
> +=20
> +
> diff --git a/meta-arm-bsp/documentation/n1sdp.md
> b/meta-arm-bsp/documentation/n1sdp.md
> new file mode 100644
> index 0000000..24e35f0
> --- /dev/null
> +++ b/meta-arm-bsp/documentation/n1sdp.md
> @@ -0,0 +1,64 @@
> +# N1SDP Development Platform Support in meta-arm-bsp
> +
> +## Configuration:
> +In the local.conf file, MACHINE should be set as follow:
> +MACHINE ?=3D "n1sdp"
> +
> +## Building
> +```bash$ bitbake core-image-minimal```
> +
> +## Running
> +
> +# Update Firmware on SD card:
> +
> +(*) To use n1sdp board in single chip mode, flash:
> +    n1sdp-board-firmware_primary.tar.gz firmware.
> +
> +(*) To use n1sdp board in multi chip mode, flash:
> +    n1sdp-board-firmware_primary.tar.gz firmware to primary board,
> +    n1sdp-board-firmware_secondary.tar.gz firmware to secondary board.
> +
> +The SD card content is generated during the build here:
> +  tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz
> +  tmp/deploy/images/n1sdp/n1sdp-board-firmware_secondary.tar.gz
> +
> +
> +Its content must be written on the N1SDP firmware SD card.
> +To do this:
> +- insert the sdcard of the N1SDP in an SD card reader and mount it:
> +```bash$ sudo mount /dev/sdx1 /mnt```
> +(replace sdx by the device of the SD card)
> +
> +- erase its content and put the new one:
> +```bash$ sudo rm -rf /mnt/*```
> +```bash$ sudo tar --no-same-owner -xzf
> tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz -C /mnt/```
> +```bash$ sudo umount /mnt```
> +
> +- reinsert the SD card in the N1SDP board
> +
> +Firmware tarball contains iofpga configuration files, scp and uefi bina=
ries.
> +
> +**NOTE**:
> +If the N1SDP board was manufactured after November 2019 (Serial Number
> greater
> +than 36253xxx), a different PMIC firmware image must be used to prevent
> +potential damage to the board. More details can be found in [1].
> +The `MB/HBI0316A/io_v123f.txt` file located in the microSD needs to be
> updated.
> +To update it, set the PMIC image (300k_8c2.bin) to be used in the newer
> models
> +by running the following commands on your host PC:
> +
> +    $ sudo umount /dev/sdx1
> +    $ sudo mount /dev/sdx1 /mnt
> +    $ sudo sed -i '/^MBPMIC: pms_0V85.bin/s/^/;/g'
> /mnt/MB/HBI0316A/io_v123f.txt
> +    $ sudo sed -i '/^;MBPMIC: 300k_8c2.bin/s/^;//g'
> /mnt/MB/HBI0316A/io_v123f.txt
> +    $ sudo umount /mnt
> +
> +# Prepare an USB hard drive:
> +
> +Grub boot partition is placed on first partition of the *.wic image,
> +Linux root file system is placed on the second partition of the *.wic i=
mage:
> +  tmp/deploy/images/n1sdp/core-image-minimal-n1sdp.wic
> +
> +This *.wic image should be copied to USB stick with simple dd call.
> +
> +
> +[1]:
> https://community.arm.com/developer/tools-software/oss-platforms/w/docs/=
604/notice-potential-damage-to-n1sdp-boards-if-using-latest-firmware-releas=
e
> diff --git
> a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> new file mode 100644
> index 0000000..e52a019
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> @@ -0,0 +1,53 @@
> +DESCRIPTION =3D "Board Firmware binaries for N1SDP"
> +
> +# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file=
.
> +# Uncomment, or copy this line to your local.conf to build board firmwa=
re,
> +# if you are using custom n1sdp.conf file.
> +# Please make sure to check the applicable license beforehand!
> +#LICENSE_FLAGS_WHITELIST =3D "stm-sla0044"
> +
> +LICENSE =3D "STM-SLA0044-Rev5"
> +LICENSE_FLAGS =3D "stm-sla0044"
> +
> +LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSES/STM.TXT;md5=3D4b8dab81d0bfc0a5f63c9a983402705b"
> +
> +SECTION =3D "firmware"
> +
> +inherit deploy
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE =3D "n1sdp"
> +RM_WORK_EXCLUDE +=3D "${PN}"
> +
> +PV =3D "2020.07.27"
> +TAG =3D "N1SDP-${PV}"
> +FIRMWARE_TARBALL =3D "n1sdp-board-firmware-${TAG}"
> +UNPACK_DIR =3D "n1sdp-board-firmware_source"
> +S =3D "${WORKDIR}/${UNPACK_DIR}"
> +
> +SRC_URI =3D
> "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.g=
it/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=3D0"
> +SRC_URI[md5sum] =3D "8ba3807ff8f222201154861f11524b14"
> +SRC_URI[sha256sum] =3D
> "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +
> +do_install() {
> +    cd ${WORKDIR}
> +    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz
> --exclude=3D${FIRMWARE_TARBALL}/SOFTWARE/*
> +    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}
> +
> +    cp -av ${S} ${D}
> +}
> +do_install[dirs] +=3D "${S}"
> +do_install[cleandirs] +=3D "${S}"
> +
> +FILES_${PN} =3D "/${UNPACK_DIR}/*"
> +SYSROOT_DIRS +=3D "/${UNPACK_DIR}"
> +addtask install after do_unpack before do_populate_lic
> +
> +do_deploy() {
> +    cp -av ${S} ${DEPLOYDIR}
> +}
> +addtask deploy after do_install
> diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> new file mode 100644
> index 0000000..9749d70
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> @@ -0,0 +1,80 @@
> +SUMMARY =3D "Firmware image recipe for generating SD-Card artifacts."
> +
> +inherit deploy nopackages
> +
> +DEPENDS =3D "virtual/uefi-firmware \
> +           virtual/control-processor-firmware \
> +           board-firmware-n1sdp"
> +
> +LICENSE =3D "MIT"
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "n1sdp"
> +RM_WORK_EXCLUDE +=3D "${PN}"
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +
> +FIRMWARE_DIR =3D "n1sdp-board-firmware_source"
> +PRIMARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_primary"
> +SECONDARY_DIR =3D "${WORKDIR}/n1sdp-board-firmware_secondary"
> +
> +SOC_BINARIES_PRIMARY =3D "mcp_rom.bin scp_rom.bin ${SOC_BINARIES_SECOND=
ARY}"
> +SOC_BINARIES_SECONDARY =3D "mcp_fw.bin scp_fw.bin"
> +
> +
> +prepare_package() {
> +    cd ${WORKDIR}
> +
> +    # Master/Primary
> +    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${PRIMARY_DIR}
> +    mkdir -p ${PRIMARY_DIR}/SOFTWARE/
> +
> +    # Copy uefi binary
> +    cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
> +
> +    # Copy SOC binaries
> +    for f in ${SOC_BINARIES_PRIMARY}; do
> +        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
> +    done
> +
> +    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable
> TRUE/FALSE|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side
> SLAVE/MASTER|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000=
100  
> ;SoC SCC PLATFORM_CTRL|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +
> +    # Slave/Secondary
> +    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}
> +    mkdir -p ${SECONDARY_DIR}/SOFTWARE/
> +
> +    # Copy SOC binaries
> +    for f in ${SOC_BINARIES_SECONDARY}; do
> +        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE=
/
> +    done
> +
> +    sed -ie 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable
> TRUE/FALSE|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -ie 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side
> SLAVE/MASTER|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -ie 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000=
101  
> ;SoC SCC PLATFORM_CTRL|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +}
> +
> +do_deploy() {
> +    # prepare Master & Slave packages
> +    prepare_package
> +
> +    for dir in ${PRIMARY_DIR} ${SECONDARY_DIR}; do
> +        dir_name=3D$(basename ${dir})
> +        mkdir -p ${D}/${dir_name}
> +        cp -av ${dir} ${D}
> +
> +        # Compress the files
> +        tar -C ${D}/${dir_name} -zcvf ${DEPLOYDIR}/${dir_name}.tar.gz .=
/
> +    done
> +}
> +do_deploy[dirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
> +do_deploy[cleandirs] +=3D "${PRIMARY_DIR} ${SECONDARY_DIR}"
> +do_deploy[umask] =3D "022"
> +addtask deploy after do_populate_sysroot
> --=20
> 2.17.1
>=20
>
