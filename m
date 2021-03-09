Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12211.1615309248014166316
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 09:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86F6B1FB;
	Tue,  9 Mar 2021 09:00:47 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.46.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE6B03F73C;
	Tue,  9 Mar 2021 09:00:46 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm-autonomy/n1sdp: Use anonymous function to set kernel provider
Date: Tue,  9 Mar 2021 17:00:25 +0000
Message-Id: <20210309170026.3985947-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Only set PREFERRED_PROVIDER_virtual/kernel in arm-autonomy to
linux-linaro-arm if it is set to linux-yocto. Allows it to be
modifed from local.conf, e.g. for RT builds.

Issue-Id: SCM-2185
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ied871389ccaa017437babb4f0cb48d23862eb7bd
---
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n=
1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/c=
onf/machine/n1sdp-extra-settings.inc
index f39e2ea..3612b2e 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
@@ -50,8 +50,11 @@ IMAGE_EFI_BOOT_FILES +=3D "xen-n1sdp.efi;xen.efi"
 IMAGE_EFI_BOOT_FILES +=3D "${XEN_MOD_DEVICETREE_DTBS}"
=20
 # Use 5.4 kernel until later versions have been validated for autonomy-h=
ost
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-linaro-arm"
-PREFERRED_VERSION_linux-linaro-arm =3D "5.4%"
+python() {
+    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') =3D=3D 'linux-yocto=
':
+        d.setVar('PREFERRED_PROVIDER_virtual/kernel', 'linux-linaro-arm'=
)
+        d.setVar('PREFERRED_VERSION_linux-linaro-arm', '5.4%')
+}
=20
 # When alternate-kernel DISTRO_FEATURE is present we set the linux-linar=
o-arm-rt
 # by default
--=20
2.25.1

