Return-Path: <Ziad.Elhanafy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DF8EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 15:55:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.903.1689782118977751774
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 08:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ziad.elhanafy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D22F2F4;
	Wed, 19 Jul 2023 08:56:01 -0700 (PDT)
Received: from e128087.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24CEA3F67D;
	Wed, 19 Jul 2023 08:55:16 -0700 (PDT)
From: ziad.elhanafy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH 2/3] kas: Add fvp-eula.yml and remove license related settings
Date: Wed, 19 Jul 2023 16:54:48 +0100
Message-Id: <20230719155449.3456824-2-ziad.elhanafy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
References: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 15:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4905

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

1- Add fvp-eula.yml file which introduces ARM_FVP_EULA_ACCEPT
environment variable
2- Remove any license related settings from fvp-baser-aemv8r64-bsp.yml,
corstone500.yml and corstone1000-fvp.yml

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
---
 kas/corstone1000-fvp.yml       | 2 +-
 kas/corstone500.yml            | 3 ++-
 kas/fvp-baser-aemv8r64-bsp.yml | 6 ++----
 kas/fvp-eula.yml               | 5 +++++
 4 files changed, 10 insertions(+), 6 deletions(-)
 create mode 100644 kas/fvp-eula.yml

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index d0d10a73..7d23a53a 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -2,6 +2,7 @@ header:
   version: 11
   includes:
     - kas/corstone1000-base.yml
+    - kas/fvp-eula.yml
=20
 machine: corstone1000-fvp
=20
@@ -10,7 +11,6 @@ local_conf_header:
         # Remove Dropbear SSH as it will not fit into the corstone1000 i=
mage.
         IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
         INHERIT =3D " ${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'fvpb=
oot', '', d)}"
-        LICENSE_FLAGS_ACCEPTED:append =3D " Arm-FVP-EULA"
=20
 target:
   - corstone1000-image
diff --git a/kas/corstone500.yml b/kas/corstone500.yml
index f1587b44..d40b59df 100644
--- a/kas/corstone500.yml
+++ b/kas/corstone500.yml
@@ -1,5 +1,7 @@
 header:
   version: 11
+  includes:
+    - kas/fvp-eula.yml
=20
 distro: poky-tiny
=20
@@ -38,7 +40,6 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf =3D " coresight"
   fvp-config: |
     IMAGE_CLASSES:append =3D " ${@bb.utils.contains('BUILD_ARCH', 'x86_6=
4', 'fvpboot', '', d)}"
-    LICENSE_FLAGS_ACCEPTED:append =3D " Arm-FVP-EULA"
=20
 machine: corstone500
=20
diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index dd175d03..9f16a3f9 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -1,5 +1,7 @@
 header:
   version: 9
+  includes:
+    - kas/fvp-eula.yml
=20
 distro: poky
 machine: fvp-baser-aemv8r64
@@ -24,9 +26,6 @@ repos:
       meta:
       meta-poky:
=20
-env:
-  FVP_BASE_R_ARM_EULA_ACCEPT: "False"
-
 local_conf_header:
   base: |
     CONF_VERSION =3D "2"
@@ -34,7 +33,6 @@ local_conf_header:
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
     CORE_IMAGE_EXTRA_INSTALL:append =3D " ssh-pregen-hostkeys"
-    LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
     IMAGE_CLASSES:append =3D " testimage"
=20
 target:
diff --git a/kas/fvp-eula.yml b/kas/fvp-eula.yml
new file mode 100644
index 00000000..ab1fae0e
--- /dev/null
+++ b/kas/fvp-eula.yml
@@ -0,0 +1,5 @@
+header:
+  version: 13
+
+env:
+  ARM_FVP_EULA_ACCEPT:
--=20
2.25.1


