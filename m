Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514A6C52D1D
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:39:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.44370.1722436796802029302
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 07:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23E741063;
	Wed, 31 Jul 2024 07:40:22 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93B0A3F5A1;
	Wed, 31 Jul 2024 07:39:55 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH scarthgap 2/4] arm-systemready/linux-distros: Add kickstart file for Fedora unattended
Date: Wed, 31 Jul 2024 15:39:45 +0100
Message-Id: <20240731143947.2502491-2-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731143947.2502491-1-amr.mohamed@arm.com>
References: <20240731143947.2502491-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 14:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5937

From: Amr Mohamed <amr.mohamed@arm.com>

Add the Fedora kickstart configuration file and define a function to
modify the unpacked ISO image to add the kickstart file inside and
modify the grub.cfg file.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm-systemready-linux-distros-fedora.bb   | 16 ++++++++
 .../arm-systemready-linux-distros.inc         | 15 ++++++-
 .../unattended-boot-conf/Fedora/ks.cfg        | 39 +++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/unattended-boot-conf/Fedora/ks.cfg

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-fedora.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-fedora=
.bb
index 25990b30..de4ea36d 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
@@ -98,6 +98,22 @@ file://${COMMON_LICENSE_DIR}/OPUBL-1.0;md5=3D99367d475=
0dbf0ae6cc74209ddd52f6d \
=20
 ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
=20
+TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_fedora_unattended", "", d)}"
+
+ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "Fedo=
ra-S-dvd-aarch64-39", "", d)}"
+BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
+BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/BOOT/BOOTAA64.EFI", "", d)}"
+EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "imag=
es/efiboot.img", "", d)}"
+
 PV =3D "39.1.5"
 SRC_URI =3D "https://download.fedoraproject.org/pub/fedora/linux/release=
s/39/Server/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;d=
ownloadfilename=3D${ISO_IMAGE_NAME}.iso"
 SRC_URI[sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d173ccc8175b55dea480=
02d499f39cb30ce0"
+
+modifyiso() {
+    UNATTENDED_CONF_DIR=3D"${THISDIR}/unattended-boot-conf/Fedora"
+   =20
+    cp "${UNATTENDED_CONF_DIR}/ks.cfg" ${EXTRACTED_ISO_TEMP_DIR}
+    sed -i 's/set default=3D"1"/set default=3D"0"/g' "${EXTRACTED_ISO_TE=
MP_DIR}/EFI/BOOT/grub.cfg"
+    sed -i 's/set timeout=3D60/set timeout=3D0/g' "${EXTRACTED_ISO_TEMP_=
DIR}/EFI/BOOT/grub.cfg"
+    sed -i '0,/vmlinuz/s/vmlinuz/& inst.ks=3Dhd:LABEL=3DFedora-S-dvd-aar=
ch64-39:\/ks.cfg/' "${EXTRACTED_ISO_TEMP_DIR}/EFI/BOOT/grub.cfg"
+}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
index d80cf237..e04d7d46 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -2,7 +2,12 @@ SUMMARY =3D "Arm SystemReady Linux distros installation"
 DESCRIPTION =3D "Arm SystemReady Linux distro CD/DVD images and installa=
tion \
                target disk image"
=20
-IMAGE_CLASSES:remove =3D "license_image testimage"
+DISTRO_UNATTENDED_INST_TESTS ?=3D "0"
+
+require ${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "arm-systemr=
eady-linux-distros-unattended.inc", "", d)}
+
+IMAGE_CLASSES:remove =3D "license_image"
+IMAGE_CLASSES:remove =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TE=
STS", "", "testimage", d)}"
 BUILDHISTORY_FEATURES:remove =3D "image"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
@@ -15,7 +20,7 @@ do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
=20
 ISO_IMAGE_NAME =3D "${PN}-${PV}"
-IMAGE_LINK_NAME =3D "${PN}-${PV}-${MACHINE}"
+IMAGE_LINK_NAME =3D "${PN}-${MACHINE}"
=20
 ARM_SYSTEMREADY_LINUX_DISTRO_ISO_IMAGE =3D \
     "${DEPLOY_DIR_IMAGE}/${ISO_IMAGE_NAME}.iso"
@@ -44,7 +49,13 @@ python do_image_complete() {
     from oe.utils import execute_pre_post_process
     post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
     execute_pre_post_process(d, post_process_cmds)
+
+    if d.getVar('DISTRO_UNATTENDED_INST_TESTS') =3D=3D "1":
+        # Ensure an empty rootfs manifest exists (required by testimage)
+        fname =3D os.path.join(d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE=
_LINK_NAME') + ".manifest")
+        open(fname, 'w').close()
 }
+
 do_image_complete[nostamp] =3D "1"
 addtask image_complete after do_deploy before do_build
=20
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/unattended-boot-conf/Fedora/ks.cfg b/meta-arm-systemready/recipes-tes=
t/arm-systemready-linux-distros/unattended-boot-conf/Fedora/ks.cfg
new file mode 100644
index 00000000..f8ea3bc6
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/una=
ttended-boot-conf/Fedora/ks.cfg
@@ -0,0 +1,39 @@
+# Generated by Anaconda 39.32.6                                         =
                                                                         =
                                           =20
+# Generated by pykickstart v3.48                                        =
                                                                         =
                                           =20
+#version=3DDEVEL                                                        =
                                                                         =
                                             =20
+# Use text mode install
+text
+
+# Keyboard layouts
+keyboard --vckeymap=3Dus --xlayouts=3D'us'
+# System language
+lang en_GB.UTF-8
+
+# Use CDROM installation media
+cdrom
+
+%packages --excludedocs --ignoremissing
+@core --nodefaults
+=20
+%end
+
+# Run the Setup Agent on first boot
+firstboot --enable
+# Do not configure the X Window System
+skipx
+
+# System bootloader configuration
+bootloader --location=3Dmbr --boot-drive=3Dvda
+autopart
+# Partition clearing information
+clearpart --all --initlabel --drives=3Dvda
+
+# System timezone
+timezone Europe/London --utc
+
+# Root password
+rootpw --lock
+user --groups=3Dwheel --name=3Duser --password=3Dunsafe --gecos=3D"usr1"=
=20
+
+# Reboot after installation with an attempt to eject the installation me=
dia
+reboot --eject
--=20
2.25.1


