Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8153.1627046240182718817
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 06:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48EE1D6E;
	Fri, 23 Jul 2021 06:17:18 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.7.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E69B3F694;
	Fri, 23 Jul 2021 06:17:17 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/fvp-base: Add support for runfvp for arm-autonomy-host
Date: Fri, 23 Jul 2021 14:17:07 +0100
Message-Id: <20210723131707.2582536-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Expand the FVP_DATA variable used by the fvpboot.bbclass to load both Xen
and its device tree when building arm-autonomy-host image for fvp-base.

Issue-Id: SCM-2718
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ia6e2f6a13e84c8e762d297ac34ccbe5417a7793b
---
 .../conf/machine/fvp-base-extra-settings.inc     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/f=
vp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bs=
p/conf/machine/fvp-base-extra-settings.inc
index ee547c2..477d6d2 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base=
-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base=
-extra-settings.inc
@@ -13,6 +13,14 @@ ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-fvp-base-disk=
.wks.in"
 WKS_FILE =3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
                                  '${ARM_AUTONOMY_WKS_FILE}', d)}"
=20
+XEN_FILE ?=3D "xen-fvp-base"
+DTB_FILE ?=3D "${@ get_xen_dtb_filename(d)}"
+XEN_ADDR ?=3D "0x84000000"
+DTB_ADDR ?=3D "0x83000000"
+
+FVP_DATA    +=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${XEN_FILE}@${XEN_=
ADDR} \
+                cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${DTB_FILE}@${DTB_AD=
DR}"
+
 # Set the wks guest partition size and unit. It must be aligned with the=
 sum of
 # all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 meta=
data is
 # 1 MiB per physical volume, hence it needs to be taken into account whe=
n
@@ -21,3 +29,11 @@ GUEST_PART_SIZE ?=3D "4097"
 GUEST_PART_SIZE_UNIT ?=3D "M"
=20
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
+
+# This function uses the "KERNEL_DEVICETREE" variable and manipulates it=
 to
+# return the xen kernel device tree file name.
+def get_xen_dtb_filename(d):
+    kernel_dtb_filename =3D d.getVar('KERNEL_DEVICETREE',d)
+    xen_dtb_filename =3D os.path.splitext(os.path.basename(kernel_dtb_fi=
lename))[0] + '-xen.dtb'
+    return xen_dtb_filename
+
--=20
2.25.1

