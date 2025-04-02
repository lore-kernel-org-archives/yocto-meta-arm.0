Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04806C36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9668.1743603428797460225
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77CD01F91;
	Wed,  2 Apr 2025 07:17:11 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B83023F63F;
	Wed,  2 Apr 2025 07:17:07 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 5/6] optee-client: use the same tee group as libts
Date: Wed,  2 Apr 2025 16:16:51 +0200
Message-ID: <20250402141652.380180-5-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6439

Change optee-client to use the same bitbake variable to configure the
group name used for controlling access to /dev/tee* devices on the
target. The aim is to simplify system configuration by aligning the
two recipes.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index ac003a24..f9650249 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -21,9 +21,12 @@ EXTRA_OECMAKE =3D " \
     -DCFG_USE_PKGCONFIG=3DON \
 "
=20
+# libts uses /dev/tee devices too. Add a common variable to allow config=
uring the same group.
+TEE_GROUP_NAME ?=3D "tee"
+
 EXTRA_OECMAKE +=3D " -DCFG_ENABLE_SYSTEMD=3DOn -DSYSTEMD_UNIT_DIR=3D${sy=
stemd_system_unitdir}/"
 EXTRA_OECMAKE +=3D " -DCFG_ENABLE_UDEV=3DOn -DUDEV_UDEV_DIR=3D${nonarch_=
base_libdir}/udev/rules.d/"
-EXTRA_OECMAKE +=3D " -DCFG_TEE_GROUP=3Dtee -DCFG_TEEPRIV_GROUP=3Dteepriv=
"
+EXTRA_OECMAKE +=3D " -DCFG_TEE_GROUP=3D${TEE_GROUP_NAME} -DCFG_TEEPRIV_G=
ROUP=3Dteepriv"
=20
 EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WERROR=3D0"
=20
@@ -48,9 +51,9 @@ INITSCRIPT_PARAMS:${PN} =3D "start 10 1 2 3 4 5 . stop =
90 0 6 ."
 FILES:${PN} +=3D "${nonarch_base_libdir}/udev/rules.d/"
=20
 # Users and groups:
-# tee group to access /dev/tee*
+# TEE_GROUP_NAME group to access /dev/tee*
 # teepriv group to acess /dev/teepriv*, only tee-supplicant
 # teesuppl user and group teesuppl to run tee-supplicant
 USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system tee; --system teepriv; --system teesu=
ppl"
+GROUPADD_PARAM:${PN} =3D "--system ${TEE_GROUP_NAME}; --system teepriv; =
--system teesuppl"
 USERADD_PARAM:${PN} =3D "--system -g teesuppl --groups teepriv --home-di=
r ${localstatedir}/lib/tee -M --shell /sbin/nologin teesuppl;"
--=20
2.43.0


