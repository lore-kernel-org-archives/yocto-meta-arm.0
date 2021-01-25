Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.34740.1611570239031420605
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jan 2021 02:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58CC111FB;
	Mon, 25 Jan 2021 02:23:57 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.45.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA5233F66E;
	Mon, 25 Jan 2021 02:23:56 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy/n1sdp: Use 5.4 kernel for autonomy n1sdp builds
Date: Mon, 25 Jan 2021 10:24:07 +0000
Message-Id: <20210125102407.109406-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

meta-arm-bsp has been updated to use 5.10 kernel but further validation
required before upgrading the autonomy n1sdp kernel.

Issue-Id: SCM-2053
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3848a03d7d01dc3a1c27530ec395e1db083a9e35
---
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n=
1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/c=
onf/machine/n1sdp-extra-settings.inc
index 977efc5..f39e2ea 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
@@ -49,6 +49,10 @@ do_image_wic[depends] +=3D "xen:do_deploy"
 IMAGE_EFI_BOOT_FILES +=3D "xen-n1sdp.efi;xen.efi"
 IMAGE_EFI_BOOT_FILES +=3D "${XEN_MOD_DEVICETREE_DTBS}"
=20
+# Use 5.4 kernel until later versions have been validated for autonomy-h=
ost
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-linaro-arm"
+PREFERRED_VERSION_linux-linaro-arm =3D "5.4%"
+
 # When alternate-kernel DISTRO_FEATURE is present we set the linux-linar=
o-arm-rt
 # by default
 PREFERRED_PROVIDER_alternate/kernel ?=3D "\
--=20
2.25.1

