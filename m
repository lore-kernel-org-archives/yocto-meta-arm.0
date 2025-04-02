Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D50FC3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9653.1743603429780679734
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ADA21FC4;
	Wed,  2 Apr 2025 07:17:12 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D18FE3F63F;
	Wed,  2 Apr 2025 07:17:08 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 6/6] arm/trusted-services: fix udev management in libts
Date: Wed,  2 Apr 2025 16:16:52 +0200
Message-ID: <20250402141652.380180-6-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6440

- Change libts to stop making udev related configuration if optee-client
  is deployed to the target to avoid conflicts.
- Remove the executable permission from installed tee-udev.rules file.
- Remove teepriv device from udev file as this device is op-tee specific.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../trusted-services/libts-udev.inc           | 21 ++++++++++++++++++
 .../trusted-services/libts/tee-udev.rules     |  5 -----
 .../trusted-services/libts_git.bb             | 22 +++++--------------
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/libts-udev=
.inc

diff --git a/meta-arm/recipes-security/trusted-services/libts-udev.inc b/=
meta-arm/recipes-security/trusted-services/libts-udev.inc
new file mode 100644
index 00000000..2eedfefe
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts-udev.inc
@@ -0,0 +1,21 @@
+# Sour out /dev/tee* device creation and access control
+SRC_URI +=3D "file://tee-udev.rules \
+           "
+
+# Unix group name for dev/tee* ownership.
+TEE_GROUP_NAME ?=3D "tee"
+
+do_install:append () {
+    if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-m=
dev', 'false', 'true', d)}; then
+        install -d ${D}${nonarch_base_libdir}/udev/rules.d/
+        install -m 755 ${UNPACKDIR}/tee-udev.rules ${D}${nonarch_base_li=
bdir}/udev/rules.d/
+        sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libd=
ir}/udev/rules.d/tee-udev.rules
+    fi
+}
+
+
+inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-=
mdev', '', 'useradd', d)}
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "--system ${TEE_GROUP_NAME}"
+
+FILES:${PN} +=3D " ${nonarch_base_libdir}/udev/rules.d/"
diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.ru=
les b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
index 43fafd8c..216fe993 100644
--- a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
+++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
@@ -1,7 +1,2 @@
 # tee devices can only be accessed by the teeclnt group members
 KERNEL=3D=3D"tee[0-9]*", TAG+=3D"systemd", MODE=3D"0660", GROUP=3D"teecl=
nt"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"tee=
", \
-    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index 635e4769..de299b9a 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -5,24 +5,16 @@ TS_ENV =3D "arm-linux"
=20
 require trusted-services.inc
=20
-SRC_URI +=3D "file://tee-udev.rules \
-            file://0001-Remove-TEE-driver-external-component.patch \
+SRC_URI +=3D "file://0001-Remove-TEE-driver-external-component.patch \
            "
+# If optee-client is not included, take care of udev and related configu=
ration.
+require ${@bb.utils.contains('IMAGE_INSTALL', 'optee-client', '', 'libts=
-udev.inc', d)}
=20
 OECMAKE_SOURCEPATH=3D"${S}/deployments/libts/${TS_ENV}"
=20
 DEPENDS           +=3D "arm-ffa-user"
=20
-# Unix group name for dev/tee* ownership.
-TEE_GROUP_NAME ?=3D "teeclnt"
-
 do_install:append () {
-    if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-m=
dev', 'false', 'true', d)}; then
-        install -d ${D}${nonarch_base_libdir}/udev/rules.d/
-        install -m 755 ${UNPACKDIR}/tee-udev.rules ${D}${nonarch_base_li=
bdir}/udev/rules.d/
-        sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libd=
ir}/udev/rules.d/tee-udev.rules
-    fi
-
     # Move the dynamic libraries into the standard place.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
@@ -34,9 +26,5 @@ do_install:append () {
     fi
 }
=20
-inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-=
mdev', '', 'useradd', d)}
-USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system ${TEE_GROUP_NAME}"
-
-FILES:${PN} =3D "${libdir}/libts.so.* ${nonarch_base_libdir}/udev/rules.=
d/"
-FILES:${PN}-dev =3D "${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${lib=
dir}/libts.so"
+FILES:${PN} +=3D " ${libdir}/libts*.so.*"
+FILES:${PN}-dev +=3D " ${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${l=
ibdir}/libts*.so"
--=20
2.43.0


