Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2107.1626373600458128907
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jul 2021 11:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC7046D
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jul 2021 11:26:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75F623F7D8
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jul 2021 11:26:38 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-baser: use common fvp-base.wks file
Date: Thu, 15 Jul 2021 19:26:32 +0100
Message-Id: <20210715182632.4061071-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fvp-baser-aemv8r64.wks is identical to fvp-base.wks, so just reuse it.

Change-Id: Ib7db425b35cfd68494beb167fe167c46cdd32b3d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 2 +-
 meta-arm-bsp/wic/fvp-baser-aemv8r64.wks           | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)
 delete mode 100644 meta-arm-bsp/wic/fvp-baser-aemv8r64.wks

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 79b95a8..b937286 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -17,7 +17,7 @@ KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 IMAGE_FSTYPES +=3D "wic"
-WKS_FILE ?=3D "${MACHINE}.wks"
+WKS_FILE ?=3D "fvp-base.wks"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
diff --git a/meta-arm-bsp/wic/fvp-baser-aemv8r64.wks b/meta-arm-bsp/wic/f=
vp-baser-aemv8r64.wks
deleted file mode 100644
index 4701406..0000000
--- a/meta-arm-bsp/wic/fvp-baser-aemv8r64.wks
+++ /dev/null
@@ -1,3 +0,0 @@
-# For fvp-baser-aemv8r64 machine we just need to populate the rootfs par=
tition
-
-part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --align=
 1024 --extra-space 100
--=20
2.25.1

