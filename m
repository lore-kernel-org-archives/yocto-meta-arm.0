Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.3862.1603745075758605615
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 13:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MM0Sirui;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id b18so6021954qkc.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZFpiweA8eivWp9twGwgeaaC3VpF4X07owzlgnFeMJrQ=;
        b=MM0Sirui15ROIUJL3JmrDopPt/ea1bTg/etHTvVy1fzc7AFU4PUsTCm4OT2Arjfkqr
         jsZUPPyn/CdhpNOgypzaOEbzyweTXb2Dvi6rNgCO2tB04hdOlCVlStKb1zDUek2BTXH6
         ewvygZF/EJZTyPn3BmBeLC5DvVYakFaSHgrs2OtnVVqKwP+rHwjgddMpSjc8o/urzGr8
         HzzjYqXmoo2FUspddPhrlRL/J8Gxqy64I1jGGFCYAf4gsgV654vRzUamB5YEMgkiTsYC
         XGlu5RISSYJFUWPNpSymqzaxku0snt7LN7HIKDiKPfVcSNnAA8GbLXp2o8Ps65Bd7LzN
         6rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZFpiweA8eivWp9twGwgeaaC3VpF4X07owzlgnFeMJrQ=;
        b=XLetSqY1ApCa/nETSGIH2fw1MQEFT4L4jKyhcCZo+EgoboPGW3Gohlo2MAYMaxGtYk
         v9LFahs+9j6+gVUS/N83eXW44Q39KLE1OQ7zeIubhxGnTQ/UcNpoX2G1rj5JYR9+phy5
         M9gW82UR2jZSUYXnYCinJPE3iVbhuvZtwqtMWTuMIQJ79uQ239bFqJAu8S6k4IWZLBjA
         bvXuUpbcVKprfwsH8Vs8mGKFoYwECuFUL0qObdsrG+d4jb/WF5dqs+9Op/jNU4HVho9n
         iN/zljvNjPbGH6o0j5n8+dgMwPa1UlijhDfM5NOWzrmcQzOPdwmt/O8hhcKu1PrLMLvJ
         DnxA==
X-Gm-Message-State: AOAM532NEPMog2jQoh090U+cMQC1uEiRKcAQNyNjMYkkwaQ63aNTuNFd
	nf2t6Pv4dccczF4shZSQB4YlTQ==
X-Google-Smtp-Source: ABdhPJyw+xdfiYwXsiUjAikuUSx6FzJ/efLAkz/Te+WTMRX7/SAZ51QcCJ5PiK2UghXUsnbikifMdw==
X-Received: by 2002:a37:a46:: with SMTP id 67mr19762490qkk.477.1603745074636;
        Mon, 26 Oct 2020 13:44:34 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id f22sm7090533qtf.4.2020.10.26.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:44:34 -0700 (PDT)
Date: Mon, 26 Oct 2020 16:44:29 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/n1sdp: add board firmware recipe and documentation
Message-ID: <20201026204429.GB14261@kudzu.us>
References: <20201026102058.13079-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201026102058.13079-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2020 at 11:20:58AM +0100, Kamil Dziezyk wrote:
> board-firmware:
>  * updates scp binaries
>  * Custom license - STM-SLA0044-Rev5 - added in layer.conf,
>    whitelisted in n1sdp.conf.
> 
> firmware-image:
>  * Combines uefi, tf-a and scp binaries into a tarball.
>  * There are 2 flavours available:
>    - n1sdp-board-firmware_primary.tar.gz
>    - n1sdp-board-firmware_secondary.tar.gz
> 
> Change-Id: I82d0c995956310a569b27431f98f7c21accf8330
> Issue-Id: SCM-1508
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/layer.conf                  |  3 +
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  5 ++
>  meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 | 18 ++++
>  meta-arm-bsp/documentation/n1sdp.md           | 64 ++++++++++++++
>  .../images/board-firmware-n1sdp_2020.07.27.bb | 53 ++++++++++++
>  .../images/sdcard-image-n1sdp_0.1.bb          | 84 +++++++++++++++++++
>  6 files changed, 227 insertions(+)
>  create mode 100644 meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
>  create mode 100644 meta-arm-bsp/documentation/n1sdp.md
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index f9c2422..1260440 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -15,3 +15,6 @@ LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
>  # This won't be used by layerindex-fetch, but works everywhere else
>  LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
>  LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"
> +
> +# Additional license directories.
> +LICENSE_PATH += "${LAYERDIR}/custom-licenses"
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 4649826..3d31c4c 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -37,3 +37,8 @@ EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
>  #grub-efi
>  EFI_PROVIDER ?= "grub-efi"
>  MACHINE_FEATURES += "efi"
> +
> +# SD-Card firmware
> +# Board firmware prebuilts are shared under custom license
> +LICENSE_FLAGS_WHITELIST += "stm-sla0044"
> +EXTRA_IMAGEDEPENDS += "sdcard-image-n1sdp"
> diff --git a/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5 b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
> new file mode 100644
> index 0000000..edb5cd5
> --- /dev/null
> +++ b/meta-arm-bsp/custom-licenses/STM-SLA0044-Rev5
> @@ -0,0 +1,18 @@
> +SLA0044 Rev5/February 2018
> +
> +BY INSTALLING COPYING, DOWNLOADING, ACCESSING OR OTHERWISE USING THIS SOFTWARE OR ANY PART THEREOF (AND THE RELATED DOCUMENTATION) FROM STMICROELECTRONICS INTERNATIONAL N.V, SWISS BRANCH AND/OR ITS AFFILIATED COMPANIES (STMICROELECTRONICS), THE RECIPIENT, ON BEHALF OF HIMSELF OR HERSELF, OR ON BEHALF OF ANY ENTITY BY WHICH SUCH RECIPIENT IS EMPLOYED AND/OR ENGAGED AGREES TO BE BOUND BY THIS SOFTWARE LICENSE AGREEMENT.
> +
> +Under STMicroelectronics’ intellectual property rights, the redistribution, reproduction and use in source and binary forms of the software or any part thereof, with or without modification, are permitted provided that the following conditions are met:
> +1.	Redistribution of source code (modified or not) must retain any copyright notice, this list of conditions and the disclaimer set forth below as items 10 and 11.
> +2.	Redistributions in binary form, except as embedded into microcontroller or microprocessor device manufactured by or for STMicroelectronics or a software update for such device, must reproduce any copyright notice provided with the binary code, this list of conditions, and the disclaimer set forth below as items 10 and 11, in documentation and/or other materials provided with the distribution.
> +3.	Neither the name of STMicroelectronics nor the names of other contributors to this software may be used to endorse or promote products derived from this software or part thereof without specific written permission.
> +4.	This software or any part thereof, including modifications and/or derivative works of this software, must be used and execute solely and exclusively on or in combination with a microcontroller or microprocessor device manufactured by or for STMicroelectronics.
> +5.	No use, reproduction or redistribution of this software partially or totally may be done in any manner that would subject this software to any Open Source Terms. “Open Source Terms” shall mean any open source license which requires as part of distribution of software that the source code of such software is distributed therewith or otherwise made available, or open source license that substantially complies with the Open Source definition specified at www.opensource.org and any other comparable open source license such as for example GNU General Public License (GPL), Eclipse Public License (EPL), Apache Software License, BSD license or MIT license.
> +6.	STMicroelectronics has no obligation to provide any maintenance, support or updates for the software.
> +7.	The software is and will remain the exclusive property of STMicroelectronics and its licensors. The recipient will not take any action that jeopardizes STMicroelectronics and its licensors' proprietary rights or acquire any rights in the software, except the limited rights specified hereunder.
> +8.	The recipient shall comply with all applicable laws and regulations affecting the use of the software or any part thereof including any applicable export control law or regulation.
> +9.	Redistribution and use of this software or any part thereof other than as permitted under this license is void and will automatically terminate your rights under this license. 
> +10.	THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS, WHICH ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +11.	EXCEPT AS EXPRESSLY PERMITTED HEREUNDER, NO LICENSE OR OTHER RIGHTS, WHETHER EXPRESS OR IMPLIED, ARE GRANTED UNDER ANY PATENT OR OTHER INTELLECTUAL PROPERTY RIGHTS OF STMICROELECTRONICS OR ANY THIRD PARTY.
> + 
> +
> diff --git a/meta-arm-bsp/documentation/n1sdp.md b/meta-arm-bsp/documentation/n1sdp.md
> new file mode 100644
> index 0000000..24e35f0
> --- /dev/null
> +++ b/meta-arm-bsp/documentation/n1sdp.md
> @@ -0,0 +1,64 @@
> +# N1SDP Development Platform Support in meta-arm-bsp
> +
> +## Configuration:
> +In the local.conf file, MACHINE should be set as follow:
> +MACHINE ?= "n1sdp"
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
> +```bash$ sudo tar --no-same-owner -xzf tmp/deploy/images/n1sdp/n1sdp-board-firmware_primary.tar.gz -C /mnt/```
> +```bash$ sudo umount /mnt```
> +
> +- reinsert the SD card in the N1SDP board
> +
> +Firmware tarball contains iofpga configuration files, scp and uefi binaries.
> +
> +**NOTE**:
> +If the N1SDP board was manufactured after November 2019 (Serial Number greater
> +than 36253xxx), a different PMIC firmware image must be used to prevent
> +potential damage to the board. More details can be found in [1].
> +The `MB/HBI0316A/io_v123f.txt` file located in the microSD needs to be updated.
> +To update it, set the PMIC image (300k_8c2.bin) to be used in the newer models
> +by running the following commands on your host PC:
> +
> +    $ sudo umount /dev/sdx1
> +    $ sudo mount /dev/sdx1 /mnt
> +    $ sudo sed -i '/^MBPMIC: pms_0V85.bin/s/^/;/g' /mnt/MB/HBI0316A/io_v123f.txt
> +    $ sudo sed -i '/^;MBPMIC: 300k_8c2.bin/s/^;//g' /mnt/MB/HBI0316A/io_v123f.txt
> +    $ sudo umount /mnt
> +
> +# Prepare an USB hard drive:
> +
> +Grub boot partition is placed on first partition of the *.wic image,
> +Linux root file system is placed on the second partition of the *.wic image:
> +  tmp/deploy/images/n1sdp/core-image-minimal-n1sdp.wic
> +
> +This *.wic image should be copied to USB stick with simple dd call.
> +
> +
> +[1]: https://community.arm.com/developer/tools-software/oss-platforms/w/docs/604/notice-potential-damage-to-n1sdp-boards-if-using-latest-firmware-release
> diff --git a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> new file mode 100644
> index 0000000..8f7b6c1
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
> @@ -0,0 +1,53 @@
> +DESCRIPTION = "Board Firmware binaries for N1SDP"
> +
> +# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file.
> +# Uncomment, or copy this line to your local.conf to build board firmware,
> +# if you are using custom n1sdp.conf file.
> +# Please make sure to check the applicable license beforehand!
> +#LICENSE_FLAGS_WHITELIST = "stm-sla0044"
> +
> +LICENSE = "STM-SLA0044-Rev5"
> +LICENSE_FLAGS = "stm-sla0044"
> +
> +LIC_FILES_CHKSUM = "file://${S}/LICENSES/STM.TXT;md5=4b8dab81d0bfc0a5f63c9a983402705b"
> +
> +SECTION = "firmware"
> +
> +inherit deploy
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE = "n1sdp"
> +RM_WORK_EXCLUDE += "${PN}"
> +
> +PV = "2020.07.27"
> +TAG = "N1SDP-${PV}"
> +FIRMWARE_TARBALL = "n1sdp-board-firmware-${TAG}"
> +UNPACK_DIR = "n1sdp-board-firmware_source"
> +S = "${WORKDIR}/${UNPACK_DIR}"
> +
> +SRC_URI = "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=0"
> +SRC_URI[md5sum] = "8ba3807ff8f222201154861f11524b14"
> +SRC_URI[sha256sum] = "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +    cd ${WORKDIR}
> +    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz --exclude=${FIRMWARE_TARBALL}/SOFTWARE/*
> +    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}
> +
> +    cp -R --no-dereference --preserve=mode,links -v ${S} ${D}
> +}
> +do_install[dirs] += "${S}"
> +do_install[cleandirs] += "${S}"
> +
> +FILES_${PN} = "/${UNPACK_DIR}/*"
> +SYSROOT_DIRS += "/${UNPACK_DIR}"
> +addtask install after do_unpack before do_populate_lic
> +
> +do_deploy() {
> +    cp -av ${S} ${DEPLOYDIR}
> +}
> +addtask deploy after do_install
> diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> new file mode 100644
> index 0000000..68b13eb
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
> @@ -0,0 +1,84 @@
> +SUMMARY = "Firmware image recipe for generating SD-Card artifacts."
> +
> +inherit deploy nopackages
> +
> +DEPENDS = "virtual/uefi-firmware \
> +           virtual/control-processor-firmware \
> +           board-firmware-n1sdp"
> +
> +LICENSE = "MIT"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "n1sdp"
> +RM_WORK_EXCLUDE += "${PN}"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_install[noexec] = "1"
> +
> +FIRMWARE_DIR = "n1sdp-board-firmware_source"
> +PRIMARY_DIR = "${WORKDIR}/n1sdp-board-firmware_primary"
> +SECONDARY_DIR = "${WORKDIR}/n1sdp-board-firmware_secondary"
> +
> +SOC_BINARIES_PRIMARY = "mcp_fw.bin scp_fw.bin ${SOC_BINARIES_SECONDARY}"
> +SOC_BINARIES_SECONDARY = "mcp_rom.bin scp_rom.bin"
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
> +    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRUE/FALSE|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: MASTER            ;C2C side SLAVE/MASTER|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000100   ;SoC SCC PLATFORM_CTRL|' \
> +        ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
> +
> +    # Slave/Secondary
> +    cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}
> +    mkdir -p ${SECONDARY_DIR}/SOFTWARE/
> +
> +    # Copy SOC binaries
> +    for f in ${SOC_BINARIES_SECONDARY}; do
> +        cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
> +    done
> +
> +    sed -i -e 's|^C2C_ENABLE.*|C2C_ENABLE: TRUE            ;C2C enable TRUE/FALSE|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -i -e 's|^C2C_SIDE.*|C2C_SIDE: SLAVE             ;C2C side SLAVE/MASTER|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000101   ;SoC SCC PLATFORM_CTRL|' \
> +        ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
> +    sed -i -e '/^TOTALIMAGES:/ s|5|2|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +    sed -i -e 's|^IMAGE[^23]|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +    sed -i -e 's|^IMAGE2|IMAGE0|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +    sed -i -e 's|^IMAGE3|IMAGE1|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
> +}
> +
> +do_deploy() {
> +    # prepare Master & Slave packages
> +    prepare_package
> +
> +    for dir in ${PRIMARY_DIR} ${SECONDARY_DIR}; do
> +        dir_name=$(basename ${dir})
> +        mkdir -p ${D}/${dir_name}
> +        cp -av ${dir} ${D}
> +
> +        # Compress the files
> +        tar -C ${D}/${dir_name} -zcvf ${DEPLOYDIR}/${dir_name}.tar.gz ./
> +    done
> +}
> +do_deploy[dirs] += "${PRIMARY_DIR} ${SECONDARY_DIR}"
> +do_deploy[cleandirs] += "${PRIMARY_DIR} ${SECONDARY_DIR}"
> +do_deploy[umask] = "022"
> +addtask deploy after do_populate_sysroot
> -- 
> 2.17.1
> 

> 
> 
> 

