Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE13C41535
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.615.1651683514283639690
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C7512FC;
	Wed,  4 May 2022 09:58:35 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D233FA27;
	Wed,  4 May 2022 09:58:34 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 08/10] arm-bsp/linux: TC: Add fixes in FFA driver
Date: Wed,  4 May 2022 17:58:18 +0100
Message-Id: <20220504165820.882784-8-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3364

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I43498b3e66651d4ed8d2cedb7455f678ddf012d1
---
 .../linux/linux-arm-platforms.inc             |  4 ++
 ...-Fix-uuid-argument-passed-to-ffa_par.patch | 29 ++++++++++
 ...ware-arm_ffa-Add-ffa_dev_get_drvdata.patch | 33 ++++++++++++
 ...firmware-arm_ffa-extern-ffa_bus_type.patch | 30 +++++++++++
 ...-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch | 54 +++++++++++++++++++
 5 files changed, 150 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0031-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0032-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0033-firmware-arm_ffa-extern-ffa_bus_type.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0034-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index ce2c7f93..105b74ff 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -166,6 +166,10 @@ SRC_URI:append:tc =3D " \
     file://0028-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
     file://0029-perf-arm-cmn-Support-new-IP-features.patch \
     file://0030-perf-arm-cmn-Add-CI-700-Support.patch \
+    file://0031-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.pat=
ch \
+    file://0032-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch \
+    file://0033-firmware-arm_ffa-extern-ffa_bus_type.patch \
+    file://0034-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.pat=
ch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0031-firmware-arm_ffa-Fi=
x-uuid-argument-passed-to-ffa_par.patch
new file mode 100644
index 00000000..35b4f10b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0031-firm=
ware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
@@ -0,0 +1,29 @@
+From 4d0a8147477699d40a02f121e7c72b21547273cf Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 13 Jan 2022 20:14:25 +0000
+Subject: [PATCH 19/32] firmware: arm_ffa: Fix uuid argument passed to
+ ffa_partition_probe
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ib2749ec3e02da5bb6d835f7dbf2d608c41fad1f2
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/firmware/arm_ffa/driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
+index 14f900047ac0..8fa1785afd42 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -582,7 +582,7 @@ static int ffa_partition_info_get(const char *uuid_s=
tr,
+ 		return -ENODEV;
+ 	}
+=20
+-	count =3D ffa_partition_probe(&uuid_null, &pbuf);
++	count =3D ffa_partition_probe(&uuid, &pbuf);
+ 	if (count <=3D 0)
+ 		return -ENOENT;
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.10/tc/0032-firmware-arm_ffa-Add-ffa_dev_ge=
t_drvdata.patch
new file mode 100644
index 00000000..52cf71be
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0032-firm=
ware-arm_ffa-Add-ffa_dev_get_drvdata.patch
@@ -0,0 +1,33 @@
+From 9acd4425667e240603ec196d8b64b2b25879805e Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 13 Jan 2022 22:22:28 +0000
+Subject: [PATCH 20/32] firmware: arm_ffa: Add ffa_dev_get_drvdata
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Icd09d686cab9922563b1deda5276307ea5d94923
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/linux/arm_ffa.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+index 85651e41ded8..e5c76c1ef9ed 100644
+--- a/include/linux/arm_ffa.h
++++ b/include/linux/arm_ffa.h
+@@ -38,7 +38,12 @@ struct ffa_driver {
+=20
+ static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
+ {
+-	fdev->dev.driver_data =3D data;
++	dev_set_drvdata(&fdev->dev, data);
++}
++
++static inline void *ffa_dev_get_drvdata(struct ffa_device *fdev)
++{
++	return dev_get_drvdata(&fdev->dev);
+ }
+=20
+ #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-firmware-arm_ffa-extern-ffa_bus_type.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0033-firmware-arm_ffa-extern-ffa_bus_typ=
e.patch
new file mode 100644
index 00000000..bbbc1783
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0033-firm=
ware-arm_ffa-extern-ffa_bus_type.patch
@@ -0,0 +1,30 @@
+From 7a9298916fe892ddac5fe4e0a13a566b1636f542 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 13 Jan 2022 22:23:52 +0000
+Subject: [PATCH 21/32] firmware: arm_ffa: extern ffa_bus_type
+
+extern ffa_bus_type so that SP driver can use it in bus_find_device call=
.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ib7a6a563aa35627a545f82c796816a5f72c80d70
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/linux/arm_ffa.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+index e5c76c1ef9ed..4eb7e03ca560 100644
+--- a/include/linux/arm_ffa.h
++++ b/include/linux/arm_ffa.h
+@@ -88,6 +88,8 @@ const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_d=
evice *dev)
+ #define ffa_unregister(driver) \
+ 	ffa_driver_unregister(driver)
+=20
++extern struct bus_type ffa_bus_type;
++
+ /**
+  * module_ffa_driver() - Helper macro for registering a psa_ffa driver
+  * @__ffa_driver: ffa_driver structure
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-firmware-arm_ffa-Fi=
x-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
new file mode 100644
index 00000000..977b550c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-firm=
ware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
@@ -0,0 +1,54 @@
+From e0b9971db819fb9ed9b08a5d3f6f2a4565e92a1a Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 12:23:04 +0000
+Subject: [PATCH 22/32] firmware: arm_ffa: Fix FFA_MEM_SHARE and
+ FFA_MEM_FRAG_TX
+
+FFA memory share on success might return FFA_MEM_FRAG_RX. In that case
+set handle from w1/w2 from FFA return value.
+
+FFA_MEM_FRAG_TX call will return FFA_SUCCESS for the last fragment, so
+check for this return code.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I7ef44742d53a9e75d8587d1213be98a1352f16d4
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/firmware/arm_ffa/driver.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
+index 8fa1785afd42..a3b1df6d7f3c 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -398,11 +398,15 @@ static int ffa_mem_first_frag(u32 func_id, phys_ad=
dr_t buf, u32 buf_sz,
+ 	if (ret.a0 =3D=3D FFA_ERROR)
+ 		return ffa_to_linux_errno((int)ret.a2);
+=20
+-	if (ret.a0 !=3D FFA_SUCCESS)
++	if (ret.a0 !=3D FFA_SUCCESS && ret.a0 !=3D FFA_MEM_FRAG_RX)
+ 		return -EOPNOTSUPP;
+=20
+-	if (handle)
+-		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
++	if (handle) {
++		if (ret.a0 =3D=3D FFA_MEM_FRAG_RX)
++			*handle =3D PACK_HANDLE(ret.a1, ret.a2);
++		else
++			*handle =3D PACK_HANDLE(ret.a2, ret.a3);
++	}
+=20
+ 	return frag_len;
+ }
+@@ -426,7 +430,7 @@ static int ffa_mem_next_frag(u64 handle, u32 frag_le=
n)
+ 	if (ret.a0 =3D=3D FFA_ERROR)
+ 		return ffa_to_linux_errno((int)ret.a2);
+=20
+-	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
++	if (ret.a0 !=3D FFA_SUCCESS && ret.a0 !=3D FFA_MEM_FRAG_RX)
+ 		return -EOPNOTSUPP;
+=20
+ 	return ret.a3;
+--=20
+2.30.2
+
--=20
2.30.2


