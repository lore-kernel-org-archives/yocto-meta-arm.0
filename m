Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6133.1632222746951686198
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Sep 2021 04:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC7E106F;
	Tue, 21 Sep 2021 04:12:25 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.42.119])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6EB43F59C;
	Tue, 21 Sep 2021 04:12:24 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/n1sdp: remove debug and verbose kernel cmd line parameters from grub cfg
Date: Tue, 21 Sep 2021 12:12:17 +0100
Message-Id: <20210921111217.466729-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

By removing the verbose and debug kernel command line parameters from the=
 grub
menu entries we prevent the console printing unnecessary messages and slo=
wing
down the boot process.

Issue-Id: SCM-3027
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ieb68c606b7ed5b20191f6989aea84963b8cda778
---
 meta-arm-bsp/wic/n1sdp-grub.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/wic/n1sdp-grub.cfg b/meta-arm-bsp/wic/n1sdp-gru=
b.cfg
index 12b77a0..7323ec7 100644
--- a/meta-arm-bsp/wic/n1sdp-grub.cfg
+++ b/meta-arm-bsp/wic/n1sdp-grub.cfg
@@ -4,15 +4,15 @@ set default=3D"0"
 set timeout=3D"5"
=20
 menuentry 'Arm reference image boot on N1SDP (ACPI)' {
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4 acpi=3Dforce verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4 acpi=3Dforce
 }
=20
 menuentry 'Arm reference image boot on Single-Chip N1SDP (Device Tree)' =
{
         devicetree /n1sdp-single-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4 verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4
 }
=20
 menuentry 'Arm reference image boot on Multi-Chip N1SDP (Device Tree)' {
         devicetree /n1sdp-multi-chip.dtb
-        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4 verbose debug
+        linux /Image earlycon=3Dpl011,0x2A400000 console=3DttyAMA0,11520=
0 root=3DPARTUUID=3D6a60524d-061d-454a-bfd1-38989910eccd rootwait rootfst=
ype=3Dext4
 }
--=20
2.25.1

