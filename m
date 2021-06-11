Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10131.1623425830683166552
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 08:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 473F91FB;
	Fri, 11 Jun 2021 08:37:10 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.5.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08C43F73D;
	Fri, 11 Jun 2021 08:37:09 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/n1sdp: add kernel modules to mount FAT filesystem
Date: Fri, 11 Jun 2021 16:36:55 +0100
Message-Id: <20210611153655.362270-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds kernel modules necessary for n1sdp to mount the FAT files=
ystem
codepage 437 and NLS ISO 8859-1.

Issue-Id: SCM-2682
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I2d4fede311544917050326564b2b0a7d0123cb21
---
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n=
1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/c=
onf/machine/n1sdp-extra-settings.inc
index 5731142..0bd150b 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
@@ -84,3 +84,7 @@ IMAGE_EFI_BOOT_FILES +=3D "\
 ${@ d.getVar('GRUB_CFG_EXTRA_FILE',d) or '' \
 if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False,=
 d) and \
 d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
+
+# Additionnal kernel modules are necessary for n1sdp to be able to mount=
 FAT
+# filesystems using CP437.
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append =3D " kernel-module-nls-cp437 ke=
rnel-module-nls-iso8859-1"
--=20
2.25.1

