Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4575EC3DA40
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:09:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38986.1688994562442336074
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE94D75;
	Mon, 10 Jul 2023 06:10:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DBC03F67D;
	Mon, 10 Jul 2023 06:09:21 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/5] arm/scp-firmware: fix intermittent compile failures
Date: Mon, 10 Jul 2023 14:09:16 +0100
Message-Id: <20230710130916.3414041-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710130916.3414041-1-ross.burton@arm.com>
References: <20230710130916.3414041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4875

From: Ross Burton <ross.burton@arm.com>

scp-firmware passes -I/core/include to the compiler which doesn't exist,
and sometimes gcc emits a fatal error.  It's unclear why this doesn't
happen for everyone, but this workaround appears to be the correct
solution.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/optee-private-includes.patch        | 34 +++++++++++++++++++
 .../scp-firmware/scp-firmware_2.12.0.bb       |  5 +--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/files/optee-private=
-includes.patch

diff --git a/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includ=
es.patch b/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes=
.patch
new file mode 100644
index 00000000..c2d86022
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patc=
h
@@ -0,0 +1,34 @@
+Change the optee module includes to be private instead of public, so the=
y don't get used
+in every build, which can result in compile failures as /core/include/ d=
oesn't exit.
+
+For some reason this behaviour isn't deterministic, a ticket has been fi=
led with upstream.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/module/optee/console/CMakeLists.txt b/module/optee/console/=
CMakeLists.txt
+index aebb7cc79..942aa98c8 100644
+--- a/module/optee/console/CMakeLists.txt
++++ b/module/optee/console/CMakeLists.txt
+@@ -14,7 +14,7 @@ target_include_directories(${SCP_MODULE_TARGET}
+ # Those includes are needed for mutex definitnion that is used in optee=
_smt
+ # notification
+ target_include_directories(${SCP_MODULE_TARGET}
+-                           PUBLIC "${SCP_OPTEE_DIR}/core/arch/arm/inclu=
de/"
++                           PRIVATE "${SCP_OPTEE_DIR}/core/arch/arm/incl=
ude/"
+                                   "${SCP_OPTEE_DIR}/core/include/"
+                                   "${SCP_OPTEE_DIR}/lib/libutils/ext/in=
clude/"
+                                   "${SCP_OPTEE_DIR}/lib/libutee/include=
/")
+diff --git a/module/optee/mbx/CMakeLists.txt b/module/optee/mbx/CMakeLis=
ts.txt
+index 305fa42b7..783a7970c 100644
+--- a/module/optee/mbx/CMakeLists.txt
++++ b/module/optee/mbx/CMakeLists.txt
+@@ -15,7 +15,7 @@ target_include_directories(${SCP_MODULE_TARGET}
+ # Those includes are needed for mutex defifitnion that is used in optee=
_smt
+ # notification
+ target_include_directories(${SCP_MODULE_TARGET}
+-                           PUBLIC "${SCP_OPTEE_DIR}/core/include/"
++                           PRIVATE "${SCP_OPTEE_DIR}/core/include/"
+                                   "${SCP_OPTEE_DIR}/lib/libutils/ext/in=
clude/"
+                                   "${SCP_OPTEE_DIR}/lib/libutee/include=
/")
+=20
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index 25cd1dcd..58482cd3 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md=
5=3D9db9e3d2fb8d9300a6c3d15101
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
 SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-software/SCP-firmware.=
git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH}"
-SRCBRANCH =3D "master"
+SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH} \
+           file://optee-private-includes.patch"
=20
+SRCBRANCH =3D "master"
 SRCREV  =3D "0c7236b1851d90124210a0414fd982dc55322c7c"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
--=20
2.34.1


