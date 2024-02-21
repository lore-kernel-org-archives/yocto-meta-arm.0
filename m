Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B297C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 09:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9436.1708507502537104092
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 01:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16DE1007;
	Wed, 21 Feb 2024 01:25:40 -0800 (PST)
Received: from PW04GXMM.arm.com (unknown [10.1.36.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2EF83F73F;
	Wed, 21 Feb 2024 01:25:00 -0800 (PST)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/2] arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.1
Date: Wed, 21 Feb 2024 09:24:48 +0000
Message-Id: <20240221092449.507-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221092449.507-1-anusmita.duttamazumder@arm.com>
References: <20240221092449.507-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Feb 2024 09:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5393

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Since there are no platforms using this version, the related files can
be removed.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 5192 -----------------
 ...cpumap-Make-counter-as-unsigned-ints.patch |   69 -
 .../linux/linux-yocto-rt_6.1%.bbappend        |    5 -
 .../linux/linux-yocto-rt_6.1.bb               |   45 -
 .../linux/linux-yocto_6.1%.bbappend           |    5 -
 .../recipes-kernel/linux/linux-yocto_6.1.bb   |   38 -
 6 files changed, 5354 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/cve-exclusion_6.1.i=
nc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-perf-cpu=
map-Make-counter-as-unsigned-ints.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1%=
.bbappend
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1.=
bb
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1%.bb=
append
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/cve-exclusion_6.1.inc b/me=
ta-arm-bsp/recipes-kernel/linux/cve-exclusion_6.1.inc
deleted file mode 100644
index 04fd2c02..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ /dev/null
@@ -1,5192 +0,0 @@
-
-# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 21:10:06.148505+00:00 for version 6.1.73
-
-python check_kernel_cve_status_version() {
-    this_version =3D "6.1.73"
-    kernel_version =3D d.getVar("LINUX_VERSION")
-    if kernel_version !=3D this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
-
-CVE_STATUS[CVE-2003-1604] =3D "fixed-version: Fixed from version 2.6.12r=
c2"
-
-CVE_STATUS[CVE-2004-0230] =3D "fixed-version: Fixed from version 3.6rc1"
-
-# CVE-2005-3660 has no known resolution
-
-CVE_STATUS[CVE-2006-3635] =3D "fixed-version: Fixed from version 2.6.26r=
c5"
-
-CVE_STATUS[CVE-2006-5331] =3D "fixed-version: Fixed from version 2.6.19r=
c3"
-
-CVE_STATUS[CVE-2006-6128] =3D "fixed-version: Fixed from version 2.6.19r=
c2"
-
-# CVE-2007-3719 has no known resolution
-
-CVE_STATUS[CVE-2007-4774] =3D "fixed-version: Fixed from version 2.6.12r=
c2"
-
-CVE_STATUS[CVE-2007-6761] =3D "fixed-version: Fixed from version 2.6.24r=
c6"
-
-CVE_STATUS[CVE-2007-6762] =3D "fixed-version: Fixed from version 2.6.20r=
c5"
-
-# CVE-2008-2544 has no known resolution
-
-# CVE-2008-4609 has no known resolution
-
-CVE_STATUS[CVE-2008-7316] =3D "fixed-version: Fixed from version 2.6.25r=
c1"
-
-CVE_STATUS[CVE-2009-2692] =3D "fixed-version: Fixed from version 2.6.31r=
c6"
-
-CVE_STATUS[CVE-2010-0008] =3D "fixed-version: Fixed from version 2.6.23r=
c9"
-
-CVE_STATUS[CVE-2010-3432] =3D "fixed-version: Fixed from version 2.6.36r=
c5"
-
-# CVE-2010-4563 has no known resolution
-
-CVE_STATUS[CVE-2010-4648] =3D "fixed-version: Fixed from version 2.6.37r=
c6"
-
-CVE_STATUS[CVE-2010-5313] =3D "fixed-version: Fixed from version 2.6.38r=
c1"
-
-# CVE-2010-5321 has no known resolution
-
-CVE_STATUS[CVE-2010-5328] =3D "fixed-version: Fixed from version 2.6.35r=
c1"
-
-CVE_STATUS[CVE-2010-5329] =3D "fixed-version: Fixed from version 2.6.39r=
c1"
-
-CVE_STATUS[CVE-2010-5331] =3D "fixed-version: Fixed from version 2.6.34r=
c7"
-
-CVE_STATUS[CVE-2010-5332] =3D "fixed-version: Fixed from version 2.6.37r=
c1"
-
-CVE_STATUS[CVE-2011-4098] =3D "fixed-version: Fixed from version 3.2rc1"
-
-CVE_STATUS[CVE-2011-4131] =3D "fixed-version: Fixed from version 3.3rc1"
-
-CVE_STATUS[CVE-2011-4915] =3D "fixed-version: Fixed from version 3.2rc1"
-
-# CVE-2011-4916 has no known resolution
-
-# CVE-2011-4917 has no known resolution
-
-CVE_STATUS[CVE-2011-5321] =3D "fixed-version: Fixed from version 3.2rc1"
-
-CVE_STATUS[CVE-2011-5327] =3D "fixed-version: Fixed from version 3.1rc1"
-
-CVE_STATUS[CVE-2012-0957] =3D "fixed-version: Fixed from version 3.7rc2"
-
-CVE_STATUS[CVE-2012-2119] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2012-2136] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2012-2137] =3D "fixed-version: Fixed from version 3.5rc2"
-
-CVE_STATUS[CVE-2012-2313] =3D "fixed-version: Fixed from version 3.4rc6"
-
-CVE_STATUS[CVE-2012-2319] =3D "fixed-version: Fixed from version 3.4rc6"
-
-CVE_STATUS[CVE-2012-2372] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2012-2375] =3D "fixed-version: Fixed from version 3.4rc1"
-
-CVE_STATUS[CVE-2012-2390] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2012-2669] =3D "fixed-version: Fixed from version 3.5rc4"
-
-CVE_STATUS[CVE-2012-2744] =3D "fixed-version: Fixed from version 2.6.34r=
c1"
-
-CVE_STATUS[CVE-2012-2745] =3D "fixed-version: Fixed from version 3.4rc3"
-
-CVE_STATUS[CVE-2012-3364] =3D "fixed-version: Fixed from version 3.5rc6"
-
-CVE_STATUS[CVE-2012-3375] =3D "fixed-version: Fixed from version 3.4rc5"
-
-CVE_STATUS[CVE-2012-3400] =3D "fixed-version: Fixed from version 3.5rc5"
-
-CVE_STATUS[CVE-2012-3412] =3D "fixed-version: Fixed from version 3.6rc2"
-
-CVE_STATUS[CVE-2012-3430] =3D "fixed-version: Fixed from version 3.6rc1"
-
-CVE_STATUS[CVE-2012-3510] =3D "fixed-version: Fixed from version 2.6.19r=
c4"
-
-CVE_STATUS[CVE-2012-3511] =3D "fixed-version: Fixed from version 3.5rc6"
-
-CVE_STATUS[CVE-2012-3520] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-3552] =3D "fixed-version: Fixed from version 3.0rc1"
-
-# Skipping CVE-2012-4220, no affected_versions
-
-# Skipping CVE-2012-4221, no affected_versions
-
-# Skipping CVE-2012-4222, no affected_versions
-
-CVE_STATUS[CVE-2012-4398] =3D "fixed-version: Fixed from version 3.4rc1"
-
-CVE_STATUS[CVE-2012-4444] =3D "fixed-version: Fixed from version 2.6.36r=
c4"
-
-CVE_STATUS[CVE-2012-4461] =3D "fixed-version: Fixed from version 3.7rc6"
-
-CVE_STATUS[CVE-2012-4467] =3D "fixed-version: Fixed from version 3.6rc5"
-
-CVE_STATUS[CVE-2012-4508] =3D "fixed-version: Fixed from version 3.7rc3"
-
-CVE_STATUS[CVE-2012-4530] =3D "fixed-version: Fixed from version 3.8rc1"
-
-# CVE-2012-4542 has no known resolution
-
-CVE_STATUS[CVE-2012-4565] =3D "fixed-version: Fixed from version 3.7rc4"
-
-CVE_STATUS[CVE-2012-5374] =3D "fixed-version: Fixed from version 3.8rc1"
-
-CVE_STATUS[CVE-2012-5375] =3D "fixed-version: Fixed from version 3.8rc1"
-
-CVE_STATUS[CVE-2012-5517] =3D "fixed-version: Fixed from version 3.6rc1"
-
-CVE_STATUS[CVE-2012-6536] =3D "fixed-version: Fixed from version 3.6rc7"
-
-CVE_STATUS[CVE-2012-6537] =3D "fixed-version: Fixed from version 3.6rc7"
-
-CVE_STATUS[CVE-2012-6538] =3D "fixed-version: Fixed from version 3.6rc7"
-
-CVE_STATUS[CVE-2012-6539] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6540] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6541] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6542] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6543] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6544] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6545] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6546] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2012-6547] =3D "fixed-version: Fixed from version 3.6rc1"
-
-CVE_STATUS[CVE-2012-6548] =3D "fixed-version: Fixed from version 3.6rc1"
-
-CVE_STATUS[CVE-2012-6549] =3D "fixed-version: Fixed from version 3.6rc1"
-
-CVE_STATUS[CVE-2012-6638] =3D "fixed-version: Fixed from version 3.3rc1"
-
-CVE_STATUS[CVE-2012-6647] =3D "fixed-version: Fixed from version 3.6rc2"
-
-CVE_STATUS[CVE-2012-6657] =3D "fixed-version: Fixed from version 3.6"
-
-CVE_STATUS[CVE-2012-6689] =3D "fixed-version: Fixed from version 3.6rc5"
-
-CVE_STATUS[CVE-2012-6701] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2012-6703] =3D "fixed-version: Fixed from version 3.7rc1"
-
-CVE_STATUS[CVE-2012-6704] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2012-6712] =3D "fixed-version: Fixed from version 3.4rc1"
-
-CVE_STATUS[CVE-2013-0160] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-0190] =3D "fixed-version: Fixed from version 3.8rc5"
-
-CVE_STATUS[CVE-2013-0216] =3D "fixed-version: Fixed from version 3.8rc7"
-
-CVE_STATUS[CVE-2013-0217] =3D "fixed-version: Fixed from version 3.8rc7"
-
-CVE_STATUS[CVE-2013-0228] =3D "fixed-version: Fixed from version 3.8"
-
-CVE_STATUS[CVE-2013-0231] =3D "fixed-version: Fixed from version 3.8rc7"
-
-CVE_STATUS[CVE-2013-0268] =3D "fixed-version: Fixed from version 3.8rc6"
-
-CVE_STATUS[CVE-2013-0290] =3D "fixed-version: Fixed from version 3.8"
-
-CVE_STATUS[CVE-2013-0309] =3D "fixed-version: Fixed from version 3.7rc1"
-
-CVE_STATUS[CVE-2013-0310] =3D "fixed-version: Fixed from version 3.5"
-
-CVE_STATUS[CVE-2013-0311] =3D "fixed-version: Fixed from version 3.7rc8"
-
-CVE_STATUS[CVE-2013-0313] =3D "fixed-version: Fixed from version 3.8rc5"
-
-CVE_STATUS[CVE-2013-0343] =3D "fixed-version: Fixed from version 3.11rc7=
"
-
-CVE_STATUS[CVE-2013-0349] =3D "fixed-version: Fixed from version 3.8rc6"
-
-CVE_STATUS[CVE-2013-0871] =3D "fixed-version: Fixed from version 3.8rc5"
-
-CVE_STATUS[CVE-2013-0913] =3D "fixed-version: Fixed from version 3.9rc4"
-
-CVE_STATUS[CVE-2013-0914] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-1059] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-1763] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-1767] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-1772] =3D "fixed-version: Fixed from version 3.5rc1"
-
-CVE_STATUS[CVE-2013-1773] =3D "fixed-version: Fixed from version 3.3rc1"
-
-CVE_STATUS[CVE-2013-1774] =3D "fixed-version: Fixed from version 3.8rc5"
-
-CVE_STATUS[CVE-2013-1792] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-1796] =3D "fixed-version: Fixed from version 3.9rc4"
-
-CVE_STATUS[CVE-2013-1797] =3D "fixed-version: Fixed from version 3.9rc4"
-
-CVE_STATUS[CVE-2013-1798] =3D "fixed-version: Fixed from version 3.9rc4"
-
-CVE_STATUS[CVE-2013-1819] =3D "fixed-version: Fixed from version 3.8rc6"
-
-CVE_STATUS[CVE-2013-1826] =3D "fixed-version: Fixed from version 3.6rc7"
-
-CVE_STATUS[CVE-2013-1827] =3D "fixed-version: Fixed from version 3.6rc3"
-
-CVE_STATUS[CVE-2013-1828] =3D "fixed-version: Fixed from version 3.9rc2"
-
-CVE_STATUS[CVE-2013-1848] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-1858] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-1860] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-1928] =3D "fixed-version: Fixed from version 3.7rc3"
-
-CVE_STATUS[CVE-2013-1929] =3D "fixed-version: Fixed from version 3.9rc6"
-
-# Skipping CVE-2013-1935, no affected_versions
-
-CVE_STATUS[CVE-2013-1943] =3D "fixed-version: Fixed from version 3.0rc1"
-
-CVE_STATUS[CVE-2013-1956] =3D "fixed-version: Fixed from version 3.9rc5"
-
-CVE_STATUS[CVE-2013-1957] =3D "fixed-version: Fixed from version 3.9rc5"
-
-CVE_STATUS[CVE-2013-1958] =3D "fixed-version: Fixed from version 3.9rc5"
-
-CVE_STATUS[CVE-2013-1959] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-1979] =3D "fixed-version: Fixed from version 3.9rc8"
-
-CVE_STATUS[CVE-2013-2015] =3D "fixed-version: Fixed from version 3.8rc2"
-
-CVE_STATUS[CVE-2013-2017] =3D "fixed-version: Fixed from version 2.6.34"
-
-CVE_STATUS[CVE-2013-2058] =3D "fixed-version: Fixed from version 3.8rc4"
-
-CVE_STATUS[CVE-2013-2094] =3D "fixed-version: Fixed from version 3.9rc8"
-
-CVE_STATUS[CVE-2013-2128] =3D "fixed-version: Fixed from version 2.6.34r=
c4"
-
-CVE_STATUS[CVE-2013-2140] =3D "fixed-version: Fixed from version 3.11rc3=
"
-
-CVE_STATUS[CVE-2013-2141] =3D "fixed-version: Fixed from version 3.9rc8"
-
-CVE_STATUS[CVE-2013-2146] =3D "fixed-version: Fixed from version 3.9rc8"
-
-CVE_STATUS[CVE-2013-2147] =3D "fixed-version: Fixed from version 3.12rc3=
"
-
-CVE_STATUS[CVE-2013-2148] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-2164] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-# Skipping CVE-2013-2188, no affected_versions
-
-CVE_STATUS[CVE-2013-2206] =3D "fixed-version: Fixed from version 3.9rc4"
-
-# Skipping CVE-2013-2224, no affected_versions
-
-CVE_STATUS[CVE-2013-2232] =3D "fixed-version: Fixed from version 3.10"
-
-CVE_STATUS[CVE-2013-2234] =3D "fixed-version: Fixed from version 3.10"
-
-CVE_STATUS[CVE-2013-2237] =3D "fixed-version: Fixed from version 3.9rc6"
-
-# Skipping CVE-2013-2239, no affected_versions
-
-CVE_STATUS[CVE-2013-2546] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-2547] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-2548] =3D "fixed-version: Fixed from version 3.9rc1"
-
-CVE_STATUS[CVE-2013-2596] =3D "fixed-version: Fixed from version 3.9rc8"
-
-CVE_STATUS[CVE-2013-2634] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-2635] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-2636] =3D "fixed-version: Fixed from version 3.9rc3"
-
-CVE_STATUS[CVE-2013-2850] =3D "fixed-version: Fixed from version 3.10rc4=
"
-
-CVE_STATUS[CVE-2013-2851] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-2852] =3D "fixed-version: Fixed from version 3.10rc6=
"
-
-CVE_STATUS[CVE-2013-2888] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-2889] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2890] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2891] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2892] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-2893] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2894] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2895] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2896] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-2897] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-2898] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-2899] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-2929] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-2930] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-3076] =3D "fixed-version: Fixed from version 3.9"
-
-CVE_STATUS[CVE-2013-3222] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3223] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3224] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3225] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3226] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3227] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3228] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3229] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3230] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3231] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3232] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3233] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3234] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3235] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3236] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3237] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3301] =3D "fixed-version: Fixed from version 3.9rc7"
-
-CVE_STATUS[CVE-2013-3302] =3D "fixed-version: Fixed from version 3.8rc3"
-
-CVE_STATUS[CVE-2013-4125] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-4127] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-4129] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-4162] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-4163] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-CVE_STATUS[CVE-2013-4205] =3D "fixed-version: Fixed from version 3.11rc5=
"
-
-CVE_STATUS[CVE-2013-4220] =3D "fixed-version: Fixed from version 3.10rc4=
"
-
-CVE_STATUS[CVE-2013-4247] =3D "fixed-version: Fixed from version 3.10rc5=
"
-
-CVE_STATUS[CVE-2013-4254] =3D "fixed-version: Fixed from version 3.11rc6=
"
-
-CVE_STATUS[CVE-2013-4270] =3D "fixed-version: Fixed from version 3.12rc4=
"
-
-CVE_STATUS[CVE-2013-4299] =3D "fixed-version: Fixed from version 3.12rc6=
"
-
-CVE_STATUS[CVE-2013-4300] =3D "fixed-version: Fixed from version 3.11"
-
-CVE_STATUS[CVE-2013-4312] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2013-4343] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-4345] =3D "fixed-version: Fixed from version 3.13rc2=
"
-
-CVE_STATUS[CVE-2013-4348] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-4350] =3D "fixed-version: Fixed from version 3.12rc2=
"
-
-CVE_STATUS[CVE-2013-4387] =3D "fixed-version: Fixed from version 3.12rc4=
"
-
-CVE_STATUS[CVE-2013-4470] =3D "fixed-version: Fixed from version 3.12rc7=
"
-
-CVE_STATUS[CVE-2013-4483] =3D "fixed-version: Fixed from version 3.10rc1=
"
-
-CVE_STATUS[CVE-2013-4511] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4512] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4513] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4514] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4515] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4516] =3D "fixed-version: Fixed from version 3.12"
-
-CVE_STATUS[CVE-2013-4563] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-4579] =3D "fixed-version: Fixed from version 3.13rc7=
"
-
-CVE_STATUS[CVE-2013-4587] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2013-4588] =3D "fixed-version: Fixed from version 2.6.33r=
c4"
-
-CVE_STATUS[CVE-2013-4591] =3D "fixed-version: Fixed from version 3.8rc1"
-
-CVE_STATUS[CVE-2013-4592] =3D "fixed-version: Fixed from version 3.7rc1"
-
-# Skipping CVE-2013-4737, no affected_versions
-
-# Skipping CVE-2013-4738, no affected_versions
-
-# Skipping CVE-2013-4739, no affected_versions
-
-CVE_STATUS[CVE-2013-5634] =3D "fixed-version: Fixed from version 3.10rc5=
"
-
-CVE_STATUS[CVE-2013-6282] =3D "fixed-version: Fixed from version 3.6rc6"
-
-CVE_STATUS[CVE-2013-6367] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2013-6368] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2013-6376] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2013-6378] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-6380] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-6381] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-6382] =3D "fixed-version: Fixed from version 3.13rc4=
"
-
-CVE_STATUS[CVE-2013-6383] =3D "fixed-version: Fixed from version 3.12"
-
-# Skipping CVE-2013-6392, no affected_versions
-
-CVE_STATUS[CVE-2013-6431] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2013-6432] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-6885] =3D "fixed-version: Fixed from version 3.14rc1=
"
-
-CVE_STATUS[CVE-2013-7026] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7027] =3D "fixed-version: Fixed from version 3.12rc7=
"
-
-CVE_STATUS[CVE-2013-7263] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7264] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7265] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7266] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7267] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7268] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7269] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7270] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7271] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7281] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7339] =3D "fixed-version: Fixed from version 3.13rc7=
"
-
-CVE_STATUS[CVE-2013-7348] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2013-7421] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-# CVE-2013-7445 has no known resolution
-
-CVE_STATUS[CVE-2013-7446] =3D "fixed-version: Fixed from version 4.4rc4"
-
-CVE_STATUS[CVE-2013-7470] =3D "fixed-version: Fixed from version 3.12rc7=
"
-
-CVE_STATUS[CVE-2014-0038] =3D "fixed-version: Fixed from version 3.14rc1=
"
-
-CVE_STATUS[CVE-2014-0049] =3D "fixed-version: Fixed from version 3.14rc5=
"
-
-CVE_STATUS[CVE-2014-0055] =3D "fixed-version: Fixed from version 3.14"
-
-CVE_STATUS[CVE-2014-0069] =3D "fixed-version: Fixed from version 3.14rc4=
"
-
-CVE_STATUS[CVE-2014-0077] =3D "fixed-version: Fixed from version 3.14"
-
-CVE_STATUS[CVE-2014-0100] =3D "fixed-version: Fixed from version 3.14rc7=
"
-
-CVE_STATUS[CVE-2014-0101] =3D "fixed-version: Fixed from version 3.14rc6=
"
-
-CVE_STATUS[CVE-2014-0102] =3D "fixed-version: Fixed from version 3.14rc6=
"
-
-CVE_STATUS[CVE-2014-0131] =3D "fixed-version: Fixed from version 3.14rc7=
"
-
-CVE_STATUS[CVE-2014-0155] =3D "fixed-version: Fixed from version 3.15rc2=
"
-
-CVE_STATUS[CVE-2014-0181] =3D "fixed-version: Fixed from version 3.15rc5=
"
-
-CVE_STATUS[CVE-2014-0196] =3D "fixed-version: Fixed from version 3.15rc5=
"
-
-CVE_STATUS[CVE-2014-0203] =3D "fixed-version: Fixed from version 2.6.33r=
c5"
-
-CVE_STATUS[CVE-2014-0205] =3D "fixed-version: Fixed from version 2.6.37r=
c1"
-
-CVE_STATUS[CVE-2014-0206] =3D "fixed-version: Fixed from version 3.16rc3=
"
-
-# Skipping CVE-2014-0972, no affected_versions
-
-CVE_STATUS[CVE-2014-1438] =3D "fixed-version: Fixed from version 3.13"
-
-CVE_STATUS[CVE-2014-1444] =3D "fixed-version: Fixed from version 3.12rc7=
"
-
-CVE_STATUS[CVE-2014-1445] =3D "fixed-version: Fixed from version 3.12rc7=
"
-
-CVE_STATUS[CVE-2014-1446] =3D "fixed-version: Fixed from version 3.13rc7=
"
-
-CVE_STATUS[CVE-2014-1690] =3D "fixed-version: Fixed from version 3.13rc8=
"
-
-CVE_STATUS[CVE-2014-1737] =3D "fixed-version: Fixed from version 3.15rc5=
"
-
-CVE_STATUS[CVE-2014-1738] =3D "fixed-version: Fixed from version 3.15rc5=
"
-
-CVE_STATUS[CVE-2014-1739] =3D "fixed-version: Fixed from version 3.15rc6=
"
-
-CVE_STATUS[CVE-2014-1874] =3D "fixed-version: Fixed from version 3.14rc2=
"
-
-CVE_STATUS[CVE-2014-2038] =3D "fixed-version: Fixed from version 3.14rc1=
"
-
-CVE_STATUS[CVE-2014-2039] =3D "fixed-version: Fixed from version 3.14rc3=
"
-
-CVE_STATUS[CVE-2014-2309] =3D "fixed-version: Fixed from version 3.14rc7=
"
-
-CVE_STATUS[CVE-2014-2523] =3D "fixed-version: Fixed from version 3.14rc1=
"
-
-CVE_STATUS[CVE-2014-2568] =3D "fixed-version: Fixed from version 3.14"
-
-CVE_STATUS[CVE-2014-2580] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-2672] =3D "fixed-version: Fixed from version 3.14rc6=
"
-
-CVE_STATUS[CVE-2014-2673] =3D "fixed-version: Fixed from version 3.14rc6=
"
-
-CVE_STATUS[CVE-2014-2678] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-2706] =3D "fixed-version: Fixed from version 3.14rc6=
"
-
-CVE_STATUS[CVE-2014-2739] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-2851] =3D "fixed-version: Fixed from version 3.15rc2=
"
-
-CVE_STATUS[CVE-2014-2889] =3D "fixed-version: Fixed from version 3.2rc7"
-
-CVE_STATUS[CVE-2014-3122] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-3144] =3D "fixed-version: Fixed from version 3.15rc2=
"
-
-CVE_STATUS[CVE-2014-3145] =3D "fixed-version: Fixed from version 3.15rc2=
"
-
-CVE_STATUS[CVE-2014-3153] =3D "fixed-version: Fixed from version 3.15"
-
-CVE_STATUS[CVE-2014-3180] =3D "fixed-version: Fixed from version 3.17rc4=
"
-
-CVE_STATUS[CVE-2014-3181] =3D "fixed-version: Fixed from version 3.17rc3=
"
-
-CVE_STATUS[CVE-2014-3182] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-3183] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-3184] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-3185] =3D "fixed-version: Fixed from version 3.17rc3=
"
-
-CVE_STATUS[CVE-2014-3186] =3D "fixed-version: Fixed from version 3.17rc3=
"
-
-# Skipping CVE-2014-3519, no affected_versions
-
-CVE_STATUS[CVE-2014-3534] =3D "fixed-version: Fixed from version 3.16rc7=
"
-
-CVE_STATUS[CVE-2014-3535] =3D "fixed-version: Fixed from version 2.6.36r=
c1"
-
-CVE_STATUS[CVE-2014-3601] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-3610] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-3611] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-3631] =3D "fixed-version: Fixed from version 3.17rc5=
"
-
-CVE_STATUS[CVE-2014-3645] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2014-3646] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-3647] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-3673] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-3687] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-3688] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-3690] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-3917] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2014-3940] =3D "fixed-version: Fixed from version 3.15"
-
-CVE_STATUS[CVE-2014-4014] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2014-4027] =3D "fixed-version: Fixed from version 3.14rc1=
"
-
-CVE_STATUS[CVE-2014-4157] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-4171] =3D "fixed-version: Fixed from version 3.16rc3=
"
-
-# Skipping CVE-2014-4322, no affected_versions
-
-# Skipping CVE-2014-4323, no affected_versions
-
-CVE_STATUS[CVE-2014-4508] =3D "fixed-version: Fixed from version 3.16rc3=
"
-
-CVE_STATUS[CVE-2014-4608] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-4611] =3D "fixed-version: Fixed from version 3.16rc3=
"
-
-CVE_STATUS[CVE-2014-4652] =3D "fixed-version: Fixed from version 3.16rc2=
"
-
-CVE_STATUS[CVE-2014-4653] =3D "fixed-version: Fixed from version 3.16rc2=
"
-
-CVE_STATUS[CVE-2014-4654] =3D "fixed-version: Fixed from version 3.16rc2=
"
-
-CVE_STATUS[CVE-2014-4655] =3D "fixed-version: Fixed from version 3.16rc2=
"
-
-CVE_STATUS[CVE-2014-4656] =3D "fixed-version: Fixed from version 3.16rc2=
"
-
-CVE_STATUS[CVE-2014-4667] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2014-4699] =3D "fixed-version: Fixed from version 3.16rc4=
"
-
-CVE_STATUS[CVE-2014-4943] =3D "fixed-version: Fixed from version 3.16rc6=
"
-
-CVE_STATUS[CVE-2014-5045] =3D "fixed-version: Fixed from version 3.16rc7=
"
-
-CVE_STATUS[CVE-2014-5077] =3D "fixed-version: Fixed from version 3.16"
-
-CVE_STATUS[CVE-2014-5206] =3D "fixed-version: Fixed from version 3.17rc1=
"
-
-CVE_STATUS[CVE-2014-5207] =3D "fixed-version: Fixed from version 3.17rc1=
"
-
-# Skipping CVE-2014-5332, no affected_versions
-
-CVE_STATUS[CVE-2014-5471] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-5472] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-CVE_STATUS[CVE-2014-6410] =3D "fixed-version: Fixed from version 3.17rc5=
"
-
-CVE_STATUS[CVE-2014-6416] =3D "fixed-version: Fixed from version 3.17rc5=
"
-
-CVE_STATUS[CVE-2014-6417] =3D "fixed-version: Fixed from version 3.17rc5=
"
-
-CVE_STATUS[CVE-2014-6418] =3D "fixed-version: Fixed from version 3.17rc5=
"
-
-CVE_STATUS[CVE-2014-7145] =3D "fixed-version: Fixed from version 3.17rc2=
"
-
-# Skipping CVE-2014-7207, no affected_versions
-
-CVE_STATUS[CVE-2014-7283] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-7284] =3D "fixed-version: Fixed from version 3.15rc7=
"
-
-CVE_STATUS[CVE-2014-7822] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2014-7825] =3D "fixed-version: Fixed from version 3.18rc3=
"
-
-CVE_STATUS[CVE-2014-7826] =3D "fixed-version: Fixed from version 3.18rc3=
"
-
-CVE_STATUS[CVE-2014-7841] =3D "fixed-version: Fixed from version 3.18rc5=
"
-
-CVE_STATUS[CVE-2014-7842] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-7843] =3D "fixed-version: Fixed from version 3.18rc5=
"
-
-CVE_STATUS[CVE-2014-7970] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-7975] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-8086] =3D "fixed-version: Fixed from version 3.18rc3=
"
-
-CVE_STATUS[CVE-2014-8133] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-8134] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-8159] =3D "fixed-version: Fixed from version 4.0rc7"
-
-CVE_STATUS[CVE-2014-8160] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed from version 3.12rc1=
"
-
-CVE_STATUS[CVE-2014-8172] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-CVE_STATUS[CVE-2014-8173] =3D "fixed-version: Fixed from version 3.13rc5=
"
-
-# Skipping CVE-2014-8181, no affected_versions
-
-CVE_STATUS[CVE-2014-8369] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-8480] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-8481] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-8559] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-8709] =3D "fixed-version: Fixed from version 3.14rc3=
"
-
-CVE_STATUS[CVE-2014-8884] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2014-8989] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9090] =3D "fixed-version: Fixed from version 3.18rc6=
"
-
-CVE_STATUS[CVE-2014-9322] =3D "fixed-version: Fixed from version 3.18rc6=
"
-
-CVE_STATUS[CVE-2014-9419] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9420] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9428] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-CVE_STATUS[CVE-2014-9529] =3D "fixed-version: Fixed from version 3.19rc4=
"
-
-CVE_STATUS[CVE-2014-9584] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-CVE_STATUS[CVE-2014-9585] =3D "fixed-version: Fixed from version 3.19rc4=
"
-
-CVE_STATUS[CVE-2014-9644] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9683] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9710] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2014-9715] =3D "fixed-version: Fixed from version 3.15rc1=
"
-
-CVE_STATUS[CVE-2014-9717] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2014-9728] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-CVE_STATUS[CVE-2014-9729] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-CVE_STATUS[CVE-2014-9730] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-CVE_STATUS[CVE-2014-9731] =3D "fixed-version: Fixed from version 3.19rc3=
"
-
-# Skipping CVE-2014-9777, no affected_versions
-
-# Skipping CVE-2014-9778, no affected_versions
-
-# Skipping CVE-2014-9779, no affected_versions
-
-# Skipping CVE-2014-9780, no affected_versions
-
-# Skipping CVE-2014-9781, no affected_versions
-
-# Skipping CVE-2014-9782, no affected_versions
-
-# Skipping CVE-2014-9783, no affected_versions
-
-# Skipping CVE-2014-9784, no affected_versions
-
-# Skipping CVE-2014-9785, no affected_versions
-
-# Skipping CVE-2014-9786, no affected_versions
-
-# Skipping CVE-2014-9787, no affected_versions
-
-# Skipping CVE-2014-9788, no affected_versions
-
-# Skipping CVE-2014-9789, no affected_versions
-
-CVE_STATUS[CVE-2014-9803] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-# Skipping CVE-2014-9863, no affected_versions
-
-# Skipping CVE-2014-9864, no affected_versions
-
-# Skipping CVE-2014-9865, no affected_versions
-
-# Skipping CVE-2014-9866, no affected_versions
-
-# Skipping CVE-2014-9867, no affected_versions
-
-# Skipping CVE-2014-9868, no affected_versions
-
-# Skipping CVE-2014-9869, no affected_versions
-
-CVE_STATUS[CVE-2014-9870] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-# Skipping CVE-2014-9871, no affected_versions
-
-# Skipping CVE-2014-9872, no affected_versions
-
-# Skipping CVE-2014-9873, no affected_versions
-
-# Skipping CVE-2014-9874, no affected_versions
-
-# Skipping CVE-2014-9875, no affected_versions
-
-# Skipping CVE-2014-9876, no affected_versions
-
-# Skipping CVE-2014-9877, no affected_versions
-
-# Skipping CVE-2014-9878, no affected_versions
-
-# Skipping CVE-2014-9879, no affected_versions
-
-# Skipping CVE-2014-9880, no affected_versions
-
-# Skipping CVE-2014-9881, no affected_versions
-
-# Skipping CVE-2014-9882, no affected_versions
-
-# Skipping CVE-2014-9883, no affected_versions
-
-# Skipping CVE-2014-9884, no affected_versions
-
-# Skipping CVE-2014-9885, no affected_versions
-
-# Skipping CVE-2014-9886, no affected_versions
-
-# Skipping CVE-2014-9887, no affected_versions
-
-CVE_STATUS[CVE-2014-9888] =3D "fixed-version: Fixed from version 3.13rc1=
"
-
-# Skipping CVE-2014-9889, no affected_versions
-
-# Skipping CVE-2014-9890, no affected_versions
-
-# Skipping CVE-2014-9891, no affected_versions
-
-# Skipping CVE-2014-9892, no affected_versions
-
-# Skipping CVE-2014-9893, no affected_versions
-
-# Skipping CVE-2014-9894, no affected_versions
-
-CVE_STATUS[CVE-2014-9895] =3D "fixed-version: Fixed from version 3.11rc1=
"
-
-# Skipping CVE-2014-9896, no affected_versions
-
-# Skipping CVE-2014-9897, no affected_versions
-
-# Skipping CVE-2014-9898, no affected_versions
-
-# Skipping CVE-2014-9899, no affected_versions
-
-# Skipping CVE-2014-9900, no affected_versions
-
-CVE_STATUS[CVE-2014-9903] =3D "fixed-version: Fixed from version 3.14rc4=
"
-
-CVE_STATUS[CVE-2014-9904] =3D "fixed-version: Fixed from version 3.17rc1=
"
-
-CVE_STATUS[CVE-2014-9914] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2014-9922] =3D "fixed-version: Fixed from version 3.18rc2=
"
-
-CVE_STATUS[CVE-2014-9940] =3D "fixed-version: Fixed from version 3.19rc1=
"
-
-CVE_STATUS[CVE-2015-0239] =3D "fixed-version: Fixed from version 3.19rc6=
"
-
-CVE_STATUS[CVE-2015-0274] =3D "fixed-version: Fixed from version 3.15rc5=
"
-
-CVE_STATUS[CVE-2015-0275] =3D "fixed-version: Fixed from version 4.1rc1"
-
-# Skipping CVE-2015-0777, no affected_versions
-
-# Skipping CVE-2015-1328, no affected_versions
-
-CVE_STATUS[CVE-2015-1333] =3D "fixed-version: Fixed from version 4.2rc5"
-
-CVE_STATUS[CVE-2015-1339] =3D "fixed-version: Fixed from version 4.4rc5"
-
-CVE_STATUS[CVE-2015-1350] =3D "fixed-version: Fixed from version 4.9rc1"
-
-CVE_STATUS[CVE-2015-1420] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-1421] =3D "fixed-version: Fixed from version 3.19rc7=
"
-
-CVE_STATUS[CVE-2015-1465] =3D "fixed-version: Fixed from version 3.19rc7=
"
-
-CVE_STATUS[CVE-2015-1573] =3D "fixed-version: Fixed from version 3.19rc5=
"
-
-CVE_STATUS[CVE-2015-1593] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2015-1805] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2015-2041] =3D "fixed-version: Fixed from version 3.19rc7=
"
-
-CVE_STATUS[CVE-2015-2042] =3D "fixed-version: Fixed from version 3.19"
-
-CVE_STATUS[CVE-2015-2150] =3D "fixed-version: Fixed from version 4.0rc4"
-
-CVE_STATUS[CVE-2015-2666] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2015-2672] =3D "fixed-version: Fixed from version 4.0rc3"
-
-CVE_STATUS[CVE-2015-2686] =3D "fixed-version: Fixed from version 4.0rc6"
-
-CVE_STATUS[CVE-2015-2830] =3D "fixed-version: Fixed from version 4.0rc3"
-
-# CVE-2015-2877 has no known resolution
-
-CVE_STATUS[CVE-2015-2922] =3D "fixed-version: Fixed from version 4.0rc7"
-
-CVE_STATUS[CVE-2015-2925] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2015-3212] =3D "fixed-version: Fixed from version 4.2rc1"
-
-CVE_STATUS[CVE-2015-3214] =3D "fixed-version: Fixed from version 2.6.33r=
c8"
-
-CVE_STATUS[CVE-2015-3288] =3D "fixed-version: Fixed from version 4.2rc2"
-
-CVE_STATUS[CVE-2015-3290] =3D "fixed-version: Fixed from version 4.2rc3"
-
-CVE_STATUS[CVE-2015-3291] =3D "fixed-version: Fixed from version 4.2rc3"
-
-CVE_STATUS[CVE-2015-3331] =3D "fixed-version: Fixed from version 4.0rc5"
-
-# Skipping CVE-2015-3332, no affected_versions
-
-CVE_STATUS[CVE-2015-3339] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-3636] =3D "fixed-version: Fixed from version 4.1rc2"
-
-CVE_STATUS[CVE-2015-4001] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-4002] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-4003] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-4004] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2015-4036] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2015-4167] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2015-4170] =3D "fixed-version: Fixed from version 3.13rc5=
"
-
-CVE_STATUS[CVE-2015-4176] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-4177] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-4178] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-4692] =3D "fixed-version: Fixed from version 4.2rc1"
-
-CVE_STATUS[CVE-2015-4700] =3D "fixed-version: Fixed from version 4.1rc6"
-
-CVE_STATUS[CVE-2015-5156] =3D "fixed-version: Fixed from version 4.2rc7"
-
-CVE_STATUS[CVE-2015-5157] =3D "fixed-version: Fixed from version 4.2rc3"
-
-CVE_STATUS[CVE-2015-5257] =3D "fixed-version: Fixed from version 4.3rc3"
-
-CVE_STATUS[CVE-2015-5283] =3D "fixed-version: Fixed from version 4.3rc3"
-
-CVE_STATUS[CVE-2015-5307] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-5327] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-5364] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-5366] =3D "fixed-version: Fixed from version 4.1rc7"
-
-CVE_STATUS[CVE-2015-5697] =3D "fixed-version: Fixed from version 4.2rc6"
-
-CVE_STATUS[CVE-2015-5706] =3D "fixed-version: Fixed from version 4.1rc3"
-
-CVE_STATUS[CVE-2015-5707] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-6252] =3D "fixed-version: Fixed from version 4.2rc5"
-
-CVE_STATUS[CVE-2015-6526] =3D "fixed-version: Fixed from version 4.1rc1"
-
-# CVE-2015-6619 has no known resolution
-
-# CVE-2015-6646 has no known resolution
-
-CVE_STATUS[CVE-2015-6937] =3D "fixed-version: Fixed from version 4.3rc1"
-
-# Skipping CVE-2015-7312, no affected_versions
-
-CVE_STATUS[CVE-2015-7509] =3D "fixed-version: Fixed from version 3.7rc1"
-
-CVE_STATUS[CVE-2015-7513] =3D "fixed-version: Fixed from version 4.4rc7"
-
-CVE_STATUS[CVE-2015-7515] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-7550] =3D "fixed-version: Fixed from version 4.4rc8"
-
-# Skipping CVE-2015-7553, no affected_versions
-
-CVE_STATUS[CVE-2015-7566] =3D "fixed-version: Fixed from version 4.5rc2"
-
-CVE_STATUS[CVE-2015-7613] =3D "fixed-version: Fixed from version 4.3rc4"
-
-CVE_STATUS[CVE-2015-7799] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-7833] =3D "fixed-version: Fixed from version 4.6rc6"
-
-# Skipping CVE-2015-7837, no affected_versions
-
-CVE_STATUS[CVE-2015-7872] =3D "fixed-version: Fixed from version 4.3rc7"
-
-CVE_STATUS[CVE-2015-7884] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-7885] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-7990] =3D "fixed-version: Fixed from version 4.4rc4"
-
-# Skipping CVE-2015-8019, no affected_versions
-
-CVE_STATUS[CVE-2015-8104] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-8215] =3D "fixed-version: Fixed from version 4.0rc3"
-
-CVE_STATUS[CVE-2015-8324] =3D "fixed-version: Fixed from version 2.6.34r=
c1"
-
-CVE_STATUS[CVE-2015-8374] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-8539] =3D "fixed-version: Fixed from version 4.4rc3"
-
-CVE_STATUS[CVE-2015-8543] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8550] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8551] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8552] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8553] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8569] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8575] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8660] =3D "fixed-version: Fixed from version 4.4rc4"
-
-CVE_STATUS[CVE-2015-8709] =3D "fixed-version: Fixed from version 4.10rc1=
"
-
-CVE_STATUS[CVE-2015-8746] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2015-8767] =3D "fixed-version: Fixed from version 4.3rc4"
-
-CVE_STATUS[CVE-2015-8785] =3D "fixed-version: Fixed from version 4.4rc5"
-
-CVE_STATUS[CVE-2015-8787] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-8812] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2015-8816] =3D "fixed-version: Fixed from version 4.4rc6"
-
-CVE_STATUS[CVE-2015-8830] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-8839] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2015-8844] =3D "fixed-version: Fixed from version 4.4rc3"
-
-CVE_STATUS[CVE-2015-8845] =3D "fixed-version: Fixed from version 4.4rc3"
-
-# Skipping CVE-2015-8937, no affected_versions
-
-# Skipping CVE-2015-8938, no affected_versions
-
-# Skipping CVE-2015-8939, no affected_versions
-
-# Skipping CVE-2015-8940, no affected_versions
-
-# Skipping CVE-2015-8941, no affected_versions
-
-# Skipping CVE-2015-8942, no affected_versions
-
-# Skipping CVE-2015-8943, no affected_versions
-
-# Skipping CVE-2015-8944, no affected_versions
-
-CVE_STATUS[CVE-2015-8950] =3D "fixed-version: Fixed from version 4.1rc2"
-
-CVE_STATUS[CVE-2015-8952] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2015-8953] =3D "fixed-version: Fixed from version 4.3"
-
-CVE_STATUS[CVE-2015-8955] =3D "fixed-version: Fixed from version 4.1rc1"
-
-CVE_STATUS[CVE-2015-8956] =3D "fixed-version: Fixed from version 4.2rc1"
-
-CVE_STATUS[CVE-2015-8961] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-8962] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2015-8963] =3D "fixed-version: Fixed from version 4.4"
-
-CVE_STATUS[CVE-2015-8964] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2015-8966] =3D "fixed-version: Fixed from version 4.4rc8"
-
-CVE_STATUS[CVE-2015-8967] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2015-8970] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2015-9004] =3D "fixed-version: Fixed from version 3.19rc7=
"
-
-CVE_STATUS[CVE-2015-9016] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2015-9289] =3D "fixed-version: Fixed from version 4.2rc1"
-
-CVE_STATUS[CVE-2016-0617] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-0723] =3D "fixed-version: Fixed from version 4.5rc2"
-
-CVE_STATUS[CVE-2016-0728] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-0758] =3D "fixed-version: Fixed from version 4.6"
-
-# Skipping CVE-2016-0774, no affected_versions
-
-CVE_STATUS[CVE-2016-0821] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2016-0823] =3D "fixed-version: Fixed from version 4.0rc5"
-
-CVE_STATUS[CVE-2016-10044] =3D "fixed-version: Fixed from version 4.8rc7=
"
-
-CVE_STATUS[CVE-2016-10088] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10147] =3D "fixed-version: Fixed from version 4.9"
-
-CVE_STATUS[CVE-2016-10150] =3D "fixed-version: Fixed from version 4.9rc8=
"
-
-CVE_STATUS[CVE-2016-10153] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10154] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10200] =3D "fixed-version: Fixed from version 4.9rc7=
"
-
-CVE_STATUS[CVE-2016-10208] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10229] =3D "fixed-version: Fixed from version 4.5rc1=
"
-
-CVE_STATUS[CVE-2016-10318] =3D "fixed-version: Fixed from version 4.8rc6=
"
-
-CVE_STATUS[CVE-2016-10723] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2016-10741] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10764] =3D "fixed-version: Fixed from version 4.10rc=
1"
-
-CVE_STATUS[CVE-2016-10905] =3D "fixed-version: Fixed from version 4.8rc1=
"
-
-CVE_STATUS[CVE-2016-10906] =3D "fixed-version: Fixed from version 4.5rc6=
"
-
-CVE_STATUS[CVE-2016-10907] =3D "fixed-version: Fixed from version 4.9rc1=
"
-
-CVE_STATUS[CVE-2016-1237] =3D "fixed-version: Fixed from version 4.7rc5"
-
-CVE_STATUS[CVE-2016-1575] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-1576] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-1583] =3D "fixed-version: Fixed from version 4.7rc3"
-
-CVE_STATUS[CVE-2016-2053] =3D "fixed-version: Fixed from version 4.3rc1"
-
-CVE_STATUS[CVE-2016-2069] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2070] =3D "fixed-version: Fixed from version 4.4"
-
-CVE_STATUS[CVE-2016-2085] =3D "fixed-version: Fixed from version 4.5rc4"
-
-CVE_STATUS[CVE-2016-2117] =3D "fixed-version: Fixed from version 4.6rc5"
-
-CVE_STATUS[CVE-2016-2143] =3D "fixed-version: Fixed from version 4.5"
-
-CVE_STATUS[CVE-2016-2184] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-2185] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-2186] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-2187] =3D "fixed-version: Fixed from version 4.6rc5"
-
-CVE_STATUS[CVE-2016-2188] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2016-2383] =3D "fixed-version: Fixed from version 4.5rc4"
-
-CVE_STATUS[CVE-2016-2384] =3D "fixed-version: Fixed from version 4.5rc4"
-
-CVE_STATUS[CVE-2016-2543] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2544] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2545] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2546] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2547] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2548] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2549] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2016-2550] =3D "fixed-version: Fixed from version 4.5rc4"
-
-CVE_STATUS[CVE-2016-2782] =3D "fixed-version: Fixed from version 4.5rc2"
-
-CVE_STATUS[CVE-2016-2847] =3D "fixed-version: Fixed from version 4.5rc1"
-
-# Skipping CVE-2016-2853, no affected_versions
-
-# Skipping CVE-2016-2854, no affected_versions
-
-CVE_STATUS[CVE-2016-3044] =3D "fixed-version: Fixed from version 4.5"
-
-CVE_STATUS[CVE-2016-3070] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2016-3134] =3D "fixed-version: Fixed from version 4.6rc2"
-
-CVE_STATUS[CVE-2016-3135] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-3136] =3D "fixed-version: Fixed from version 4.6rc3"
-
-CVE_STATUS[CVE-2016-3137] =3D "fixed-version: Fixed from version 4.6rc3"
-
-CVE_STATUS[CVE-2016-3138] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-3139] =3D "fixed-version: Fixed from version 3.17rc1=
"
-
-CVE_STATUS[CVE-2016-3140] =3D "fixed-version: Fixed from version 4.6rc3"
-
-CVE_STATUS[CVE-2016-3156] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-3157] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-3672] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-3689] =3D "fixed-version: Fixed from version 4.6rc1"
-
-# Skipping CVE-2016-3695, no affected_versions
-
-# Skipping CVE-2016-3699, no affected_versions
-
-# Skipping CVE-2016-3707, no affected_versions
-
-CVE_STATUS[CVE-2016-3713] =3D "fixed-version: Fixed from version 4.7rc1"
-
-# CVE-2016-3775 has no known resolution
-
-# CVE-2016-3802 has no known resolution
-
-# CVE-2016-3803 has no known resolution
-
-CVE_STATUS[CVE-2016-3841] =3D "fixed-version: Fixed from version 4.4rc4"
-
-CVE_STATUS[CVE-2016-3857] =3D "fixed-version: Fixed from version 4.8rc2"
-
-CVE_STATUS[CVE-2016-3951] =3D "fixed-version: Fixed from version 4.5"
-
-CVE_STATUS[CVE-2016-3955] =3D "fixed-version: Fixed from version 4.6rc3"
-
-CVE_STATUS[CVE-2016-3961] =3D "fixed-version: Fixed from version 4.6rc5"
-
-CVE_STATUS[CVE-2016-4440] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4470] =3D "fixed-version: Fixed from version 4.7rc4"
-
-CVE_STATUS[CVE-2016-4482] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4485] =3D "fixed-version: Fixed from version 4.6"
-
-CVE_STATUS[CVE-2016-4486] =3D "fixed-version: Fixed from version 4.6"
-
-CVE_STATUS[CVE-2016-4557] =3D "fixed-version: Fixed from version 4.6rc6"
-
-CVE_STATUS[CVE-2016-4558] =3D "fixed-version: Fixed from version 4.6rc7"
-
-CVE_STATUS[CVE-2016-4565] =3D "fixed-version: Fixed from version 4.6rc6"
-
-CVE_STATUS[CVE-2016-4568] =3D "fixed-version: Fixed from version 4.6rc6"
-
-CVE_STATUS[CVE-2016-4569] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4578] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4580] =3D "fixed-version: Fixed from version 4.6"
-
-CVE_STATUS[CVE-2016-4581] =3D "fixed-version: Fixed from version 4.6rc7"
-
-CVE_STATUS[CVE-2016-4794] =3D "fixed-version: Fixed from version 4.7rc4"
-
-CVE_STATUS[CVE-2016-4805] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-4913] =3D "fixed-version: Fixed from version 4.6"
-
-CVE_STATUS[CVE-2016-4951] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4997] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-4998] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-5195] =3D "fixed-version: Fixed from version 4.9rc2"
-
-CVE_STATUS[CVE-2016-5243] =3D "fixed-version: Fixed from version 4.7rc3"
-
-CVE_STATUS[CVE-2016-5244] =3D "fixed-version: Fixed from version 4.7rc3"
-
-# Skipping CVE-2016-5340, no affected_versions
-
-# Skipping CVE-2016-5342, no affected_versions
-
-# Skipping CVE-2016-5343, no affected_versions
-
-# Skipping CVE-2016-5344, no affected_versions
-
-CVE_STATUS[CVE-2016-5400] =3D "fixed-version: Fixed from version 4.7"
-
-CVE_STATUS[CVE-2016-5412] =3D "fixed-version: Fixed from version 4.8rc1"
-
-CVE_STATUS[CVE-2016-5696] =3D "fixed-version: Fixed from version 4.7"
-
-CVE_STATUS[CVE-2016-5728] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-5828] =3D "fixed-version: Fixed from version 4.7rc6"
-
-CVE_STATUS[CVE-2016-5829] =3D "fixed-version: Fixed from version 4.7rc5"
-
-# CVE-2016-5870 has no known resolution
-
-CVE_STATUS[CVE-2016-6130] =3D "fixed-version: Fixed from version 4.6rc6"
-
-CVE_STATUS[CVE-2016-6136] =3D "fixed-version: Fixed from version 4.8rc1"
-
-CVE_STATUS[CVE-2016-6156] =3D "fixed-version: Fixed from version 4.7rc7"
-
-CVE_STATUS[CVE-2016-6162] =3D "fixed-version: Fixed from version 4.7"
-
-CVE_STATUS[CVE-2016-6187] =3D "fixed-version: Fixed from version 4.7rc7"
-
-CVE_STATUS[CVE-2016-6197] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-6198] =3D "fixed-version: Fixed from version 4.6"
-
-CVE_STATUS[CVE-2016-6213] =3D "fixed-version: Fixed from version 4.9rc1"
-
-CVE_STATUS[CVE-2016-6327] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-6480] =3D "fixed-version: Fixed from version 4.8rc3"
-
-CVE_STATUS[CVE-2016-6516] =3D "fixed-version: Fixed from version 4.8rc1"
-
-# Skipping CVE-2016-6753, no affected_versions
-
-CVE_STATUS[CVE-2016-6786] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2016-6787] =3D "fixed-version: Fixed from version 4.0rc1"
-
-CVE_STATUS[CVE-2016-6828] =3D "fixed-version: Fixed from version 4.8rc5"
-
-CVE_STATUS[CVE-2016-7039] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-7042] =3D "fixed-version: Fixed from version 4.9rc3"
-
-CVE_STATUS[CVE-2016-7097] =3D "fixed-version: Fixed from version 4.9rc1"
-
-CVE_STATUS[CVE-2016-7117] =3D "fixed-version: Fixed from version 4.6rc1"
-
-# Skipping CVE-2016-7118, no affected_versions
-
-CVE_STATUS[CVE-2016-7425] =3D "fixed-version: Fixed from version 4.9rc1"
-
-CVE_STATUS[CVE-2016-7910] =3D "fixed-version: Fixed from version 4.8rc1"
-
-CVE_STATUS[CVE-2016-7911] =3D "fixed-version: Fixed from version 4.7rc7"
-
-CVE_STATUS[CVE-2016-7912] =3D "fixed-version: Fixed from version 4.6rc5"
-
-CVE_STATUS[CVE-2016-7913] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-7914] =3D "fixed-version: Fixed from version 4.6rc4"
-
-CVE_STATUS[CVE-2016-7915] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-7916] =3D "fixed-version: Fixed from version 4.6rc7"
-
-CVE_STATUS[CVE-2016-7917] =3D "fixed-version: Fixed from version 4.5rc6"
-
-CVE_STATUS[CVE-2016-8399] =3D "fixed-version: Fixed from version 4.9"
-
-# Skipping CVE-2016-8401, no affected_versions
-
-# Skipping CVE-2016-8402, no affected_versions
-
-# Skipping CVE-2016-8403, no affected_versions
-
-# Skipping CVE-2016-8404, no affected_versions
-
-CVE_STATUS[CVE-2016-8405] =3D "fixed-version: Fixed from version 4.10rc6=
"
-
-# Skipping CVE-2016-8406, no affected_versions
-
-# Skipping CVE-2016-8407, no affected_versions
-
-CVE_STATUS[CVE-2016-8630] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-8632] =3D "fixed-version: Fixed from version 4.9rc8"
-
-CVE_STATUS[CVE-2016-8633] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-8636] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2016-8645] =3D "fixed-version: Fixed from version 4.9rc6"
-
-CVE_STATUS[CVE-2016-8646] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2016-8650] =3D "fixed-version: Fixed from version 4.9rc7"
-
-CVE_STATUS[CVE-2016-8655] =3D "fixed-version: Fixed from version 4.9rc8"
-
-CVE_STATUS[CVE-2016-8658] =3D "fixed-version: Fixed from version 4.8rc7"
-
-# CVE-2016-8660 has no known resolution
-
-CVE_STATUS[CVE-2016-8666] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-9083] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-9084] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-9120] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-9178] =3D "fixed-version: Fixed from version 4.8rc7"
-
-CVE_STATUS[CVE-2016-9191] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2016-9313] =3D "fixed-version: Fixed from version 4.9rc3"
-
-CVE_STATUS[CVE-2016-9555] =3D "fixed-version: Fixed from version 4.9rc4"
-
-CVE_STATUS[CVE-2016-9576] =3D "fixed-version: Fixed from version 4.9"
-
-CVE_STATUS[CVE-2016-9588] =3D "fixed-version: Fixed from version 4.10rc1=
"
-
-CVE_STATUS[CVE-2016-9604] =3D "fixed-version: Fixed from version 4.11rc8=
"
-
-# Skipping CVE-2016-9644, no affected_versions
-
-CVE_STATUS[CVE-2016-9685] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2016-9754] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-9755] =3D "fixed-version: Fixed from version 4.9rc8"
-
-CVE_STATUS[CVE-2016-9756] =3D "fixed-version: Fixed from version 4.9rc7"
-
-CVE_STATUS[CVE-2016-9777] =3D "fixed-version: Fixed from version 4.9rc7"
-
-CVE_STATUS[CVE-2016-9793] =3D "fixed-version: Fixed from version 4.9rc8"
-
-CVE_STATUS[CVE-2016-9794] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-9806] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2016-9919] =3D "fixed-version: Fixed from version 4.9rc8"
-
-# Skipping CVE-2017-0403, no affected_versions
-
-# Skipping CVE-2017-0404, no affected_versions
-
-# Skipping CVE-2017-0426, no affected_versions
-
-# Skipping CVE-2017-0427, no affected_versions
-
-# CVE-2017-0507 has no known resolution
-
-# CVE-2017-0508 has no known resolution
-
-# Skipping CVE-2017-0510, no affected_versions
-
-# Skipping CVE-2017-0528, no affected_versions
-
-# Skipping CVE-2017-0537, no affected_versions
-
-# CVE-2017-0564 has no known resolution
-
-CVE_STATUS[CVE-2017-0605] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-0627] =3D "fixed-version: Fixed from version 4.14rc1=
"
-
-# CVE-2017-0630 has no known resolution
-
-# CVE-2017-0749 has no known resolution
-
-CVE_STATUS[CVE-2017-0750] =3D "fixed-version: Fixed from version 4.5rc1"
-
-CVE_STATUS[CVE-2017-0786] =3D "fixed-version: Fixed from version 4.14rc4=
"
-
-CVE_STATUS[CVE-2017-0861] =3D "fixed-version: Fixed from version 4.15rc3=
"
-
-CVE_STATUS[CVE-2017-1000] =3D "fixed-version: Fixed from version 4.13rc5=
"
-
-CVE_STATUS[CVE-2017-1000111] =3D "fixed-version: Fixed from version 4.13=
rc5"
-
-CVE_STATUS[CVE-2017-1000112] =3D "fixed-version: Fixed from version 4.13=
rc5"
-
-CVE_STATUS[CVE-2017-1000251] =3D "fixed-version: Fixed from version 4.14=
rc1"
-
-CVE_STATUS[CVE-2017-1000252] =3D "fixed-version: Fixed from version 4.14=
rc1"
-
-CVE_STATUS[CVE-2017-1000253] =3D "fixed-version: Fixed from version 4.1r=
c1"
-
-CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed from version 4.14=
rc5"
-
-CVE_STATUS[CVE-2017-1000363] =3D "fixed-version: Fixed from version 4.12=
rc2"
-
-CVE_STATUS[CVE-2017-1000364] =3D "fixed-version: Fixed from version 4.12=
rc6"
-
-CVE_STATUS[CVE-2017-1000365] =3D "fixed-version: Fixed from version 4.12=
rc7"
-
-CVE_STATUS[CVE-2017-1000370] =3D "fixed-version: Fixed from version 4.13=
rc1"
-
-CVE_STATUS[CVE-2017-1000371] =3D "fixed-version: Fixed from version 4.13=
rc1"
-
-CVE_STATUS[CVE-2017-1000379] =3D "fixed-version: Fixed from version 4.12=
rc6"
-
-CVE_STATUS[CVE-2017-1000380] =3D "fixed-version: Fixed from version 4.12=
rc5"
-
-CVE_STATUS[CVE-2017-1000405] =3D "fixed-version: Fixed from version 4.15=
rc2"
-
-CVE_STATUS[CVE-2017-1000407] =3D "fixed-version: Fixed from version 4.15=
rc3"
-
-CVE_STATUS[CVE-2017-1000410] =3D "fixed-version: Fixed from version 4.15=
rc8"
-
-CVE_STATUS[CVE-2017-10661] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2017-10662] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2017-10663] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-10810] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2017-10911] =3D "fixed-version: Fixed from version 4.12rc=
7"
-
-CVE_STATUS[CVE-2017-11089] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-11176] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-11472] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2017-11473] =3D "fixed-version: Fixed from version 4.13rc=
2"
-
-CVE_STATUS[CVE-2017-11600] =3D "fixed-version: Fixed from version 4.13"
-
-CVE_STATUS[CVE-2017-12134] =3D "fixed-version: Fixed from version 4.13rc=
6"
-
-CVE_STATUS[CVE-2017-12146] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-12153] =3D "fixed-version: Fixed from version 4.14rc=
2"
-
-CVE_STATUS[CVE-2017-12154] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2017-12168] =3D "fixed-version: Fixed from version 4.9rc6=
"
-
-CVE_STATUS[CVE-2017-12188] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-12190] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-12192] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-12193] =3D "fixed-version: Fixed from version 4.14rc=
7"
-
-CVE_STATUS[CVE-2017-12762] =3D "fixed-version: Fixed from version 4.13rc=
4"
-
-CVE_STATUS[CVE-2017-13080] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-13166] =3D "fixed-version: Fixed from version 4.16rc=
1"
-
-CVE_STATUS[CVE-2017-13167] =3D "fixed-version: Fixed from version 4.5rc4=
"
-
-CVE_STATUS[CVE-2017-13168] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2017-13215] =3D "fixed-version: Fixed from version 4.5rc1=
"
-
-CVE_STATUS[CVE-2017-13216] =3D "fixed-version: Fixed from version 4.15rc=
8"
-
-CVE_STATUS[CVE-2017-13220] =3D "fixed-version: Fixed from version 3.19rc=
3"
-
-# CVE-2017-13221 has no known resolution
-
-# CVE-2017-13222 has no known resolution
-
-CVE_STATUS[CVE-2017-13305] =3D "fixed-version: Fixed from version 4.12rc=
5"
-
-CVE_STATUS[CVE-2017-13686] =3D "fixed-version: Fixed from version 4.13rc=
7"
-
-# CVE-2017-13693 has no known resolution
-
-# CVE-2017-13694 has no known resolution
-
-CVE_STATUS[CVE-2017-13695] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2017-13715] =3D "fixed-version: Fixed from version 4.3rc1=
"
-
-CVE_STATUS[CVE-2017-14051] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2017-14106] =3D "fixed-version: Fixed from version 4.12rc=
3"
-
-CVE_STATUS[CVE-2017-14140] =3D "fixed-version: Fixed from version 4.13rc=
6"
-
-CVE_STATUS[CVE-2017-14156] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2017-14340] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2017-14489] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-14497] =3D "fixed-version: Fixed from version 4.13"
-
-CVE_STATUS[CVE-2017-14954] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-14991] =3D "fixed-version: Fixed from version 4.14rc=
2"
-
-CVE_STATUS[CVE-2017-15102] =3D "fixed-version: Fixed from version 4.9rc1=
"
-
-CVE_STATUS[CVE-2017-15115] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-15116] =3D "fixed-version: Fixed from version 4.2rc1=
"
-
-CVE_STATUS[CVE-2017-15121] =3D "fixed-version: Fixed from version 3.11rc=
1"
-
-CVE_STATUS[CVE-2017-15126] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-15127] =3D "fixed-version: Fixed from version 4.13rc=
5"
-
-CVE_STATUS[CVE-2017-15128] =3D "fixed-version: Fixed from version 4.14rc=
8"
-
-CVE_STATUS[CVE-2017-15129] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-15265] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-15274] =3D "fixed-version: Fixed from version 4.12rc=
5"
-
-CVE_STATUS[CVE-2017-15299] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-15306] =3D "fixed-version: Fixed from version 4.14rc=
7"
-
-CVE_STATUS[CVE-2017-15537] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-15649] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-15868] =3D "fixed-version: Fixed from version 3.19rc=
3"
-
-CVE_STATUS[CVE-2017-15951] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-16525] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-16526] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-16527] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-16528] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2017-16529] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-16530] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-16531] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-16532] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-16533] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-16534] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2017-16535] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-16536] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-16537] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-16538] =3D "fixed-version: Fixed from version 4.16rc=
1"
-
-CVE_STATUS[CVE-2017-16643] =3D "fixed-version: Fixed from version 4.14rc=
7"
-
-CVE_STATUS[CVE-2017-16644] =3D "fixed-version: Fixed from version 4.16rc=
1"
-
-CVE_STATUS[CVE-2017-16645] =3D "fixed-version: Fixed from version 4.14rc=
6"
-
-CVE_STATUS[CVE-2017-16646] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-16647] =3D "fixed-version: Fixed from version 4.14"
-
-CVE_STATUS[CVE-2017-16648] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-16649] =3D "fixed-version: Fixed from version 4.14"
-
-CVE_STATUS[CVE-2017-16650] =3D "fixed-version: Fixed from version 4.14"
-
-CVE_STATUS[CVE-2017-16911] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-16912] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-16913] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-16914] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-16939] =3D "fixed-version: Fixed from version 4.14rc=
7"
-
-CVE_STATUS[CVE-2017-16994] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-16995] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-16996] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17052] =3D "fixed-version: Fixed from version 4.13rc=
7"
-
-CVE_STATUS[CVE-2017-17053] =3D "fixed-version: Fixed from version 4.13rc=
7"
-
-CVE_STATUS[CVE-2017-17448] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17449] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17450] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17558] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17712] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17741] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17805] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17806] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-17807] =3D "fixed-version: Fixed from version 4.15rc=
3"
-
-CVE_STATUS[CVE-2017-17852] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17853] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17854] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17855] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17856] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17857] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17862] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-17863] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17864] =3D "fixed-version: Fixed from version 4.15rc=
5"
-
-CVE_STATUS[CVE-2017-17975] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2017-18017] =3D "fixed-version: Fixed from version 4.11rc=
7"
-
-CVE_STATUS[CVE-2017-18075] =3D "fixed-version: Fixed from version 4.15rc=
7"
-
-CVE_STATUS[CVE-2017-18079] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-# CVE-2017-18169 has no known resolution
-
-CVE_STATUS[CVE-2017-18174] =3D "fixed-version: Fixed from version 4.7rc1=
"
-
-CVE_STATUS[CVE-2017-18193] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-18200] =3D "fixed-version: Fixed from version 4.14rc=
5"
-
-CVE_STATUS[CVE-2017-18202] =3D "fixed-version: Fixed from version 4.15rc=
2"
-
-CVE_STATUS[CVE-2017-18203] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-18204] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-18208] =3D "fixed-version: Fixed from version 4.15rc=
2"
-
-CVE_STATUS[CVE-2017-18216] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-18218] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-18221] =3D "fixed-version: Fixed from version 4.12rc=
4"
-
-CVE_STATUS[CVE-2017-18222] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2017-18224] =3D "fixed-version: Fixed from version 4.15rc=
1"
-
-CVE_STATUS[CVE-2017-18232] =3D "fixed-version: Fixed from version 4.16rc=
1"
-
-CVE_STATUS[CVE-2017-18241] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-18249] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2017-18255] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2017-18257] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2017-18261] =3D "fixed-version: Fixed from version 4.13rc=
6"
-
-CVE_STATUS[CVE-2017-18270] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-18344] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2017-18360] =3D "fixed-version: Fixed from version 4.12rc=
2"
-
-CVE_STATUS[CVE-2017-18379] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2017-18509] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2017-18549] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-18550] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2017-18551] =3D "fixed-version: Fixed from version 4.15rc=
9"
-
-CVE_STATUS[CVE-2017-18552] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2017-18595] =3D "fixed-version: Fixed from version 4.15rc=
6"
-
-CVE_STATUS[CVE-2017-2583] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-2584] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-2596] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-2618] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-2634] =3D "fixed-version: Fixed from version 2.6.25r=
c1"
-
-CVE_STATUS[CVE-2017-2636] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2017-2647] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2017-2671] =3D "fixed-version: Fixed from version 4.11rc6=
"
-
-CVE_STATUS[CVE-2017-5123] =3D "fixed-version: Fixed from version 4.14rc5=
"
-
-CVE_STATUS[CVE-2017-5546] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-5547] =3D "fixed-version: Fixed from version 4.10rc5=
"
-
-CVE_STATUS[CVE-2017-5548] =3D "fixed-version: Fixed from version 4.10rc5=
"
-
-CVE_STATUS[CVE-2017-5549] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-5550] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-5551] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-5576] =3D "fixed-version: Fixed from version 4.10rc6=
"
-
-CVE_STATUS[CVE-2017-5577] =3D "fixed-version: Fixed from version 4.10rc6=
"
-
-CVE_STATUS[CVE-2017-5669] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-5715] =3D "fixed-version: Fixed from version 4.15rc8=
"
-
-CVE_STATUS[CVE-2017-5753] =3D "fixed-version: Fixed from version 4.15rc8=
"
-
-CVE_STATUS[CVE-2017-5754] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2017-5897] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-5967] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-5970] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-5972] =3D "fixed-version: Fixed from version 4.4rc1"
-
-CVE_STATUS[CVE-2017-5986] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-6001] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-6074] =3D "fixed-version: Fixed from version 4.10"
-
-CVE_STATUS[CVE-2017-6214] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-6345] =3D "fixed-version: Fixed from version 4.10"
-
-CVE_STATUS[CVE-2017-6346] =3D "fixed-version: Fixed from version 4.10"
-
-CVE_STATUS[CVE-2017-6347] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-6348] =3D "fixed-version: Fixed from version 4.10"
-
-CVE_STATUS[CVE-2017-6353] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-6874] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2017-6951] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2017-7184] =3D "fixed-version: Fixed from version 4.11rc5=
"
-
-CVE_STATUS[CVE-2017-7187] =3D "fixed-version: Fixed from version 4.11rc5=
"
-
-CVE_STATUS[CVE-2017-7261] =3D "fixed-version: Fixed from version 4.11rc6=
"
-
-CVE_STATUS[CVE-2017-7273] =3D "fixed-version: Fixed from version 4.10rc4=
"
-
-CVE_STATUS[CVE-2017-7277] =3D "fixed-version: Fixed from version 4.11rc4=
"
-
-CVE_STATUS[CVE-2017-7294] =3D "fixed-version: Fixed from version 4.11rc6=
"
-
-CVE_STATUS[CVE-2017-7308] =3D "fixed-version: Fixed from version 4.11rc6=
"
-
-CVE_STATUS[CVE-2017-7346] =3D "fixed-version: Fixed from version 4.12rc5=
"
-
-# CVE-2017-7369 has no known resolution
-
-CVE_STATUS[CVE-2017-7374] =3D "fixed-version: Fixed from version 4.11rc4=
"
-
-CVE_STATUS[CVE-2017-7472] =3D "fixed-version: Fixed from version 4.11rc8=
"
-
-CVE_STATUS[CVE-2017-7477] =3D "fixed-version: Fixed from version 4.11"
-
-CVE_STATUS[CVE-2017-7482] =3D "fixed-version: Fixed from version 4.12rc7=
"
-
-CVE_STATUS[CVE-2017-7487] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-7495] =3D "fixed-version: Fixed from version 4.7rc1"
-
-CVE_STATUS[CVE-2017-7518] =3D "fixed-version: Fixed from version 4.12rc7=
"
-
-CVE_STATUS[CVE-2017-7533] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2017-7541] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2017-7542] =3D "fixed-version: Fixed from version 4.13rc2=
"
-
-CVE_STATUS[CVE-2017-7558] =3D "fixed-version: Fixed from version 4.13"
-
-CVE_STATUS[CVE-2017-7616] =3D "fixed-version: Fixed from version 4.11rc6=
"
-
-CVE_STATUS[CVE-2017-7618] =3D "fixed-version: Fixed from version 4.11rc8=
"
-
-CVE_STATUS[CVE-2017-7645] =3D "fixed-version: Fixed from version 4.11"
-
-CVE_STATUS[CVE-2017-7889] =3D "fixed-version: Fixed from version 4.11rc7=
"
-
-CVE_STATUS[CVE-2017-7895] =3D "fixed-version: Fixed from version 4.11"
-
-CVE_STATUS[CVE-2017-7979] =3D "fixed-version: Fixed from version 4.11rc8=
"
-
-CVE_STATUS[CVE-2017-8061] =3D "fixed-version: Fixed from version 4.11rc4=
"
-
-CVE_STATUS[CVE-2017-8062] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2017-8063] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-8064] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-8065] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-8066] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-8067] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2017-8068] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-8069] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-8070] =3D "fixed-version: Fixed from version 4.10rc8=
"
-
-CVE_STATUS[CVE-2017-8071] =3D "fixed-version: Fixed from version 4.10rc7=
"
-
-CVE_STATUS[CVE-2017-8072] =3D "fixed-version: Fixed from version 4.10rc7=
"
-
-CVE_STATUS[CVE-2017-8106] =3D "fixed-version: Fixed from version 3.16rc1=
"
-
-CVE_STATUS[CVE-2017-8240] =3D "fixed-version: Fixed from version 3.19rc6=
"
-
-# CVE-2017-8242 has no known resolution
-
-# CVE-2017-8244 has no known resolution
-
-# CVE-2017-8245 has no known resolution
-
-# CVE-2017-8246 has no known resolution
-
-CVE_STATUS[CVE-2017-8797] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-8824] =3D "fixed-version: Fixed from version 4.15rc3=
"
-
-CVE_STATUS[CVE-2017-8831] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2017-8890] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-8924] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2017-8925] =3D "fixed-version: Fixed from version 4.11rc2=
"
-
-CVE_STATUS[CVE-2017-9059] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-9074] =3D "fixed-version: Fixed from version 4.12rc2=
"
-
-CVE_STATUS[CVE-2017-9075] =3D "fixed-version: Fixed from version 4.12rc2=
"
-
-CVE_STATUS[CVE-2017-9076] =3D "fixed-version: Fixed from version 4.12rc2=
"
-
-CVE_STATUS[CVE-2017-9077] =3D "fixed-version: Fixed from version 4.12rc2=
"
-
-CVE_STATUS[CVE-2017-9150] =3D "fixed-version: Fixed from version 4.12rc1=
"
-
-CVE_STATUS[CVE-2017-9211] =3D "fixed-version: Fixed from version 4.12rc3=
"
-
-CVE_STATUS[CVE-2017-9242] =3D "fixed-version: Fixed from version 4.12rc3=
"
-
-CVE_STATUS[CVE-2017-9605] =3D "fixed-version: Fixed from version 4.12rc5=
"
-
-CVE_STATUS[CVE-2017-9725] =3D "fixed-version: Fixed from version 4.3rc7"
-
-CVE_STATUS[CVE-2017-9984] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2017-9985] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2017-9986] =3D "fixed-version: Fixed from version 4.15rc1=
"
-
-CVE_STATUS[CVE-2018-1000004] =3D "fixed-version: Fixed from version 4.15=
rc9"
-
-CVE_STATUS[CVE-2018-1000026] =3D "fixed-version: Fixed from version 4.16=
rc1"
-
-CVE_STATUS[CVE-2018-1000028] =3D "fixed-version: Fixed from version 4.15=
"
-
-CVE_STATUS[CVE-2018-1000199] =3D "fixed-version: Fixed from version 4.16=
"
-
-CVE_STATUS[CVE-2018-1000200] =3D "fixed-version: Fixed from version 4.17=
rc5"
-
-CVE_STATUS[CVE-2018-1000204] =3D "fixed-version: Fixed from version 4.17=
rc7"
-
-CVE_STATUS[CVE-2018-10021] =3D "fixed-version: Fixed from version 4.16rc=
7"
-
-CVE_STATUS[CVE-2018-10074] =3D "fixed-version: Fixed from version 4.16rc=
7"
-
-CVE_STATUS[CVE-2018-10087] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2018-10124] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2018-10322] =3D "fixed-version: Fixed from version 4.17rc=
4"
-
-CVE_STATUS[CVE-2018-10323] =3D "fixed-version: Fixed from version 4.17rc=
4"
-
-CVE_STATUS[CVE-2018-1065] =3D "fixed-version: Fixed from version 4.16rc3=
"
-
-CVE_STATUS[CVE-2018-1066] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2018-10675] =3D "fixed-version: Fixed from version 4.13rc=
6"
-
-CVE_STATUS[CVE-2018-1068] =3D "fixed-version: Fixed from version 4.16rc5=
"
-
-CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-10853] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-1087] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-# CVE-2018-10872 has no known resolution
-
-CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10877] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10878] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10879] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10880] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10881] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10883] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-10901] =3D "fixed-version: Fixed from version 2.6.36=
rc1"
-
-CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed from version 4.18rc=
6"
-
-CVE_STATUS[CVE-2018-1091] =3D "fixed-version: Fixed from version 4.14rc2=
"
-
-CVE_STATUS[CVE-2018-1092] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-CVE_STATUS[CVE-2018-1093] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-CVE_STATUS[CVE-2018-10938] =3D "fixed-version: Fixed from version 4.13rc=
5"
-
-CVE_STATUS[CVE-2018-1094] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-CVE_STATUS[CVE-2018-10940] =3D "fixed-version: Fixed from version 4.17rc=
3"
-
-CVE_STATUS[CVE-2018-1095] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-CVE_STATUS[CVE-2018-1108] =3D "fixed-version: Fixed from version 4.17rc2=
"
-
-CVE_STATUS[CVE-2018-1118] =3D "fixed-version: Fixed from version 4.18rc1=
"
-
-CVE_STATUS[CVE-2018-1120] =3D "fixed-version: Fixed from version 4.17rc6=
"
-
-# CVE-2018-1121 has no known resolution
-
-CVE_STATUS[CVE-2018-11232] =3D "fixed-version: Fixed from version 4.11rc=
1"
-
-CVE_STATUS[CVE-2018-1128] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-1129] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-1130] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-CVE_STATUS[CVE-2018-11412] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-11506] =3D "fixed-version: Fixed from version 4.17rc=
7"
-
-CVE_STATUS[CVE-2018-11508] =3D "fixed-version: Fixed from version 4.17rc=
5"
-
-# CVE-2018-11987 has no known resolution
-
-CVE_STATUS[CVE-2018-12126] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2018-12127] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2018-12130] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2018-12207] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2018-12232] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-12233] =3D "fixed-version: Fixed from version 4.18rc=
2"
-
-CVE_STATUS[CVE-2018-12633] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-12714] =3D "fixed-version: Fixed from version 4.18rc=
2"
-
-CVE_STATUS[CVE-2018-12896] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-12904] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-# CVE-2018-12928 has no known resolution
-
-# CVE-2018-12929 has no known resolution
-
-# CVE-2018-12930 has no known resolution
-
-# CVE-2018-12931 has no known resolution
-
-CVE_STATUS[CVE-2018-13053] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13093] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-13094] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-13095] =3D "fixed-version: Fixed from version 4.18rc=
3"
-
-CVE_STATUS[CVE-2018-13096] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13097] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13098] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13099] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13100] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-13405] =3D "fixed-version: Fixed from version 4.18rc=
4"
-
-CVE_STATUS[CVE-2018-13406] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-14609] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14610] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14611] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14612] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14613] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14614] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14615] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14616] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14617] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-14619] =3D "fixed-version: Fixed from version 4.15rc=
4"
-
-CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed from version 4.20rc=
6"
-
-CVE_STATUS[CVE-2018-14633] =3D "fixed-version: Fixed from version 4.19rc=
6"
-
-CVE_STATUS[CVE-2018-14634] =3D "fixed-version: Fixed from version 4.13rc=
1"
-
-CVE_STATUS[CVE-2018-14641] =3D "fixed-version: Fixed from version 4.19rc=
4"
-
-CVE_STATUS[CVE-2018-14646] =3D "fixed-version: Fixed from version 4.15rc=
8"
-
-CVE_STATUS[CVE-2018-14656] =3D "fixed-version: Fixed from version 4.19rc=
2"
-
-CVE_STATUS[CVE-2018-14678] =3D "fixed-version: Fixed from version 4.18rc=
8"
-
-CVE_STATUS[CVE-2018-14734] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-15471] =3D "fixed-version: Fixed from version 4.19rc=
7"
-
-CVE_STATUS[CVE-2018-15572] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-15594] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-16276] =3D "fixed-version: Fixed from version 4.18rc=
5"
-
-CVE_STATUS[CVE-2018-16597] =3D "fixed-version: Fixed from version 4.8rc1=
"
-
-CVE_STATUS[CVE-2018-16658] =3D "fixed-version: Fixed from version 4.19rc=
2"
-
-CVE_STATUS[CVE-2018-16862] =3D "fixed-version: Fixed from version 4.20rc=
5"
-
-CVE_STATUS[CVE-2018-16871] =3D "fixed-version: Fixed from version 4.20rc=
3"
-
-CVE_STATUS[CVE-2018-16880] =3D "fixed-version: Fixed from version 5.0rc5=
"
-
-CVE_STATUS[CVE-2018-16882] =3D "fixed-version: Fixed from version 4.20"
-
-CVE_STATUS[CVE-2018-16884] =3D "fixed-version: Fixed from version 5.0rc1=
"
-
-# CVE-2018-16885 has no known resolution
-
-CVE_STATUS[CVE-2018-17182] =3D "fixed-version: Fixed from version 4.19rc=
4"
-
-CVE_STATUS[CVE-2018-17972] =3D "fixed-version: Fixed from version 4.19rc=
7"
-
-# CVE-2018-17977 has no known resolution
-
-CVE_STATUS[CVE-2018-18021] =3D "fixed-version: Fixed from version 4.19rc=
7"
-
-CVE_STATUS[CVE-2018-18281] =3D "fixed-version: Fixed from version 4.19"
-
-CVE_STATUS[CVE-2018-18386] =3D "fixed-version: Fixed from version 4.15rc=
6"
-
-CVE_STATUS[CVE-2018-18397] =3D "fixed-version: Fixed from version 4.20rc=
5"
-
-CVE_STATUS[CVE-2018-18445] =3D "fixed-version: Fixed from version 4.19rc=
7"
-
-CVE_STATUS[CVE-2018-18559] =3D "fixed-version: Fixed from version 4.15rc=
2"
-
-# CVE-2018-18653 has no known resolution
-
-CVE_STATUS[CVE-2018-18690] =3D "fixed-version: Fixed from version 4.17rc=
4"
-
-CVE_STATUS[CVE-2018-18710] =3D "fixed-version: Fixed from version 4.20rc=
1"
-
-CVE_STATUS[CVE-2018-18955] =3D "fixed-version: Fixed from version 4.20rc=
2"
-
-CVE_STATUS[CVE-2018-19406] =3D "fixed-version: Fixed from version 4.20rc=
5"
-
-CVE_STATUS[CVE-2018-19407] =3D "fixed-version: Fixed from version 4.20rc=
5"
-
-CVE_STATUS[CVE-2018-19824] =3D "fixed-version: Fixed from version 4.20rc=
6"
-
-CVE_STATUS[CVE-2018-19854] =3D "fixed-version: Fixed from version 4.20rc=
3"
-
-CVE_STATUS[CVE-2018-19985] =3D "fixed-version: Fixed from version 4.20"
-
-CVE_STATUS[CVE-2018-20169] =3D "fixed-version: Fixed from version 4.20rc=
6"
-
-CVE_STATUS[CVE-2018-20449] =3D "fixed-version: Fixed from version 4.15rc=
2"
-
-CVE_STATUS[CVE-2018-20509] =3D "fixed-version: Fixed from version 4.14rc=
1"
-
-CVE_STATUS[CVE-2018-20510] =3D "fixed-version: Fixed from version 4.16rc=
3"
-
-CVE_STATUS[CVE-2018-20511] =3D "fixed-version: Fixed from version 4.19rc=
5"
-
-CVE_STATUS[CVE-2018-20669] =3D "fixed-version: Fixed from version 5.0rc1=
"
-
-CVE_STATUS[CVE-2018-20784] =3D "fixed-version: Fixed from version 5.0rc1=
"
-
-CVE_STATUS[CVE-2018-20836] =3D "fixed-version: Fixed from version 4.20rc=
1"
-
-CVE_STATUS[CVE-2018-20854] =3D "fixed-version: Fixed from version 4.20rc=
1"
-
-CVE_STATUS[CVE-2018-20855] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-20856] =3D "fixed-version: Fixed from version 4.19rc=
1"
-
-CVE_STATUS[CVE-2018-20961] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2018-20976] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-21008] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2018-25015] =3D "fixed-version: Fixed from version 4.15rc=
9"
-
-CVE_STATUS[CVE-2018-25020] =3D "fixed-version: Fixed from version 4.17rc=
7"
-
-# CVE-2018-3574 has no known resolution
-
-CVE_STATUS[CVE-2018-3620] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-3639] =3D "fixed-version: Fixed from version 4.17rc7=
"
-
-CVE_STATUS[CVE-2018-3646] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-3665] =3D "fixed-version: Fixed from version 3.7rc1"
-
-CVE_STATUS[CVE-2018-3693] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-5332] =3D "fixed-version: Fixed from version 4.15rc8=
"
-
-CVE_STATUS[CVE-2018-5333] =3D "fixed-version: Fixed from version 4.15rc8=
"
-
-CVE_STATUS[CVE-2018-5344] =3D "fixed-version: Fixed from version 4.15rc8=
"
-
-CVE_STATUS[CVE-2018-5390] =3D "fixed-version: Fixed from version 4.18rc7=
"
-
-CVE_STATUS[CVE-2018-5391] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-5703] =3D "fixed-version: Fixed from version 4.16rc5=
"
-
-CVE_STATUS[CVE-2018-5750] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2018-5803] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2018-5814] =3D "fixed-version: Fixed from version 4.17rc6=
"
-
-CVE_STATUS[CVE-2018-5848] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-# Skipping CVE-2018-5856, no affected_versions
-
-CVE_STATUS[CVE-2018-5873] =3D "fixed-version: Fixed from version 4.11rc8=
"
-
-CVE_STATUS[CVE-2018-5953] =3D "fixed-version: Fixed from version 4.15rc2=
"
-
-CVE_STATUS[CVE-2018-5995] =3D "fixed-version: Fixed from version 4.15rc2=
"
-
-CVE_STATUS[CVE-2018-6412] =3D "fixed-version: Fixed from version 4.16rc5=
"
-
-CVE_STATUS[CVE-2018-6554] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-CVE_STATUS[CVE-2018-6555] =3D "fixed-version: Fixed from version 4.17rc1=
"
-
-# CVE-2018-6559 has no known resolution
-
-CVE_STATUS[CVE-2018-6927] =3D "fixed-version: Fixed from version 4.15rc9=
"
-
-CVE_STATUS[CVE-2018-7191] =3D "fixed-version: Fixed from version 4.14rc6=
"
-
-CVE_STATUS[CVE-2018-7273] =3D "fixed-version: Fixed from version 4.15rc2=
"
-
-CVE_STATUS[CVE-2018-7480] =3D "fixed-version: Fixed from version 4.11rc1=
"
-
-CVE_STATUS[CVE-2018-7492] =3D "fixed-version: Fixed from version 4.15rc3=
"
-
-CVE_STATUS[CVE-2018-7566] =3D "fixed-version: Fixed from version 4.16rc2=
"
-
-CVE_STATUS[CVE-2018-7740] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-CVE_STATUS[CVE-2018-7754] =3D "fixed-version: Fixed from version 4.15rc2=
"
-
-CVE_STATUS[CVE-2018-7755] =3D "fixed-version: Fixed from version 4.19rc5=
"
-
-CVE_STATUS[CVE-2018-7757] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2018-7995] =3D "fixed-version: Fixed from version 4.16rc5=
"
-
-CVE_STATUS[CVE-2018-8043] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2018-8087] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2018-8781] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-CVE_STATUS[CVE-2018-8822] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-CVE_STATUS[CVE-2018-8897] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-CVE_STATUS[CVE-2018-9363] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2018-9385] =3D "fixed-version: Fixed from version 4.17rc3=
"
-
-CVE_STATUS[CVE-2018-9415] =3D "fixed-version: Fixed from version 4.17rc3=
"
-
-CVE_STATUS[CVE-2018-9422] =3D "fixed-version: Fixed from version 4.6rc1"
-
-CVE_STATUS[CVE-2018-9465] =3D "fixed-version: Fixed from version 4.15rc6=
"
-
-CVE_STATUS[CVE-2018-9516] =3D "fixed-version: Fixed from version 4.18rc5=
"
-
-CVE_STATUS[CVE-2018-9517] =3D "fixed-version: Fixed from version 4.14rc1=
"
-
-CVE_STATUS[CVE-2018-9518] =3D "fixed-version: Fixed from version 4.16rc3=
"
-
-CVE_STATUS[CVE-2018-9568] =3D "fixed-version: Fixed from version 4.14rc4=
"
-
-CVE_STATUS[CVE-2019-0136] =3D "fixed-version: Fixed from version 5.2rc6"
-
-CVE_STATUS[CVE-2019-0145] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-0146] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-0147] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-0148] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-0149] =3D "fixed-version: Fixed from version 5.3rc1"
-
-CVE_STATUS[CVE-2019-0154] =3D "fixed-version: Fixed from version 5.4rc8"
-
-CVE_STATUS[CVE-2019-0155] =3D "fixed-version: Fixed from version 5.4rc8"
-
-CVE_STATUS[CVE-2019-10124] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-10125] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-10126] =3D "fixed-version: Fixed from version 5.2rc6=
"
-
-# CVE-2019-10140 has no known resolution
-
-CVE_STATUS[CVE-2019-10142] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-10207] =3D "fixed-version: Fixed from version 5.3rc3=
"
-
-CVE_STATUS[CVE-2019-10220] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-10638] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-10639] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-11085] =3D "fixed-version: Fixed from version 5.0rc3=
"
-
-CVE_STATUS[CVE-2019-11091] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-11135] =3D "fixed-version: Fixed from version 5.4rc8=
"
-
-CVE_STATUS[CVE-2019-11190] =3D "fixed-version: Fixed from version 4.8rc5=
"
-
-CVE_STATUS[CVE-2019-11191] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-1125] =3D "fixed-version: Fixed from version 5.3rc4"
-
-CVE_STATUS[CVE-2019-11477] =3D "fixed-version: Fixed from version 5.2rc6=
"
-
-CVE_STATUS[CVE-2019-11478] =3D "fixed-version: Fixed from version 5.2rc6=
"
-
-CVE_STATUS[CVE-2019-11479] =3D "fixed-version: Fixed from version 5.2rc6=
"
-
-CVE_STATUS[CVE-2019-11486] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-11487] =3D "fixed-version: Fixed from version 5.1rc5=
"
-
-CVE_STATUS[CVE-2019-11599] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-11683] =3D "fixed-version: Fixed from version 5.1"
-
-CVE_STATUS[CVE-2019-11810] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-11811] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-11815] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-11833] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-11884] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-12378] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-12379] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-12380] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-12381] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-12382] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-12454] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-12455] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-# CVE-2019-12456 has no known resolution
-
-CVE_STATUS[CVE-2019-12614] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-12615] =3D "fixed-version: Fixed from version 5.2rc4=
"
-
-CVE_STATUS[CVE-2019-12817] =3D "fixed-version: Fixed from version 5.2rc7=
"
-
-CVE_STATUS[CVE-2019-12818] =3D "fixed-version: Fixed from version 5.0"
-
-CVE_STATUS[CVE-2019-12819] =3D "fixed-version: Fixed from version 5.0rc8=
"
-
-CVE_STATUS[CVE-2019-12881] =3D "fixed-version: Fixed from version 4.18rc=
1"
-
-CVE_STATUS[CVE-2019-12984] =3D "fixed-version: Fixed from version 5.2rc6=
"
-
-CVE_STATUS[CVE-2019-13233] =3D "fixed-version: Fixed from version 5.2rc4=
"
-
-CVE_STATUS[CVE-2019-13272] =3D "fixed-version: Fixed from version 5.2"
-
-CVE_STATUS[CVE-2019-13631] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-13648] =3D "fixed-version: Fixed from version 5.3rc2=
"
-
-CVE_STATUS[CVE-2019-14283] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-14284] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-14615] =3D "fixed-version: Fixed from version 5.5rc7=
"
-
-CVE_STATUS[CVE-2019-14763] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2019-14814] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-14815] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-14816] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-14821] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-14835] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-14895] =3D "fixed-version: Fixed from version 5.5rc3=
"
-
-CVE_STATUS[CVE-2019-14896] =3D "fixed-version: Fixed from version 5.5"
-
-CVE_STATUS[CVE-2019-14897] =3D "fixed-version: Fixed from version 5.5"
-
-# CVE-2019-14898 has no known resolution
-
-CVE_STATUS[CVE-2019-14901] =3D "fixed-version: Fixed from version 5.5rc3=
"
-
-CVE_STATUS[CVE-2019-15030] =3D "fixed-version: Fixed from version 5.3rc8=
"
-
-CVE_STATUS[CVE-2019-15031] =3D "fixed-version: Fixed from version 5.3rc8=
"
-
-CVE_STATUS[CVE-2019-15090] =3D "fixed-version: Fixed from version 5.2rc2=
"
-
-CVE_STATUS[CVE-2019-15098] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-15099] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-15117] =3D "fixed-version: Fixed from version 5.3rc5=
"
-
-CVE_STATUS[CVE-2019-15118] =3D "fixed-version: Fixed from version 5.3rc5=
"
-
-CVE_STATUS[CVE-2019-15211] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15212] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-15213] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15214] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-15215] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15216] =3D "fixed-version: Fixed from version 5.1"
-
-CVE_STATUS[CVE-2019-15217] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15218] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-15219] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2019-15220] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15221] =3D "fixed-version: Fixed from version 5.2"
-
-CVE_STATUS[CVE-2019-15222] =3D "fixed-version: Fixed from version 5.3rc3=
"
-
-CVE_STATUS[CVE-2019-15223] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-# CVE-2019-15239 has no known resolution
-
-# CVE-2019-15290 has no known resolution
-
-CVE_STATUS[CVE-2019-15291] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-15292] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-15504] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-15505] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-15538] =3D "fixed-version: Fixed from version 5.3rc6=
"
-
-CVE_STATUS[CVE-2019-15666] =3D "fixed-version: Fixed from version 5.1"
-
-# CVE-2019-15791 has no known resolution
-
-# CVE-2019-15792 has no known resolution
-
-# CVE-2019-15793 has no known resolution
-
-CVE_STATUS[CVE-2019-15794] =3D "fixed-version: Fixed from version 5.12"
-
-CVE_STATUS[CVE-2019-15807] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-# CVE-2019-15902 has no known resolution
-
-CVE_STATUS[CVE-2019-15916] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-15917] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-15918] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-15919] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-15920] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-15921] =3D "fixed-version: Fixed from version 5.1rc3=
"
-
-CVE_STATUS[CVE-2019-15922] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-15923] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-15924] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-15925] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15926] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-15927] =3D "fixed-version: Fixed from version 5.0rc2=
"
-
-# CVE-2019-16089 has no known resolution
-
-CVE_STATUS[CVE-2019-16229] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-16230] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-16231] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-16232] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-16233] =3D "fixed-version: Fixed from version 5.4rc5=
"
-
-CVE_STATUS[CVE-2019-16234] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-16413] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-16714] =3D "fixed-version: Fixed from version 5.3rc7=
"
-
-CVE_STATUS[CVE-2019-16746] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-16921] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2019-16994] =3D "fixed-version: Fixed from version 5.0"
-
-CVE_STATUS[CVE-2019-16995] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-17052] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-17053] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-17054] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-17055] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-17056] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-17075] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-17133] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-17351] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-17666] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-18198] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-18282] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-18660] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-18675] =3D "fixed-version: Fixed from version 4.17rc=
5"
-
-# CVE-2019-18680 has no known resolution
-
-CVE_STATUS[CVE-2019-18683] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-18786] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-18805] =3D "fixed-version: Fixed from version 5.1rc7=
"
-
-CVE_STATUS[CVE-2019-18806] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-18807] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-18808] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-18809] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-18810] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-18811] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-18812] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-18813] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-18814] =3D "fixed-version: Fixed from version 5.7rc7=
"
-
-CVE_STATUS[CVE-2019-18885] =3D "fixed-version: Fixed from version 5.1rc1=
"
-
-CVE_STATUS[CVE-2019-19036] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19037] =3D "fixed-version: Fixed from version 5.5rc3=
"
-
-CVE_STATUS[CVE-2019-19039] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2019-19043] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19044] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-19045] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-19046] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19047] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-19048] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19049] =3D "fixed-version: Fixed from version 5.4rc5=
"
-
-CVE_STATUS[CVE-2019-19050] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19051] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-19052] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-19053] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19054] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19055] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-19056] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19057] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19058] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-19059] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-19060] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19061] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19062] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19063] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19064] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19065] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19066] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19067] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-19068] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19069] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19070] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19071] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19072] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19073] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19074] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19075] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-19076] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19077] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19078] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19079] =3D "fixed-version: Fixed from version 5.3"
-
-CVE_STATUS[CVE-2019-19080] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19081] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19082] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19083] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-19227] =3D "fixed-version: Fixed from version 5.1rc3=
"
-
-CVE_STATUS[CVE-2019-19241] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19252] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19318] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19319] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-19332] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19338] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19377] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-# CVE-2019-19378 has no known resolution
-
-CVE_STATUS[CVE-2019-19447] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19448] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2019-19449] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2019-19462] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2019-19523] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19524] =3D "fixed-version: Fixed from version 5.4rc8=
"
-
-CVE_STATUS[CVE-2019-19525] =3D "fixed-version: Fixed from version 5.4rc2=
"
-
-CVE_STATUS[CVE-2019-19526] =3D "fixed-version: Fixed from version 5.4rc4=
"
-
-CVE_STATUS[CVE-2019-19527] =3D "fixed-version: Fixed from version 5.3rc4=
"
-
-CVE_STATUS[CVE-2019-19528] =3D "fixed-version: Fixed from version 5.4rc3=
"
-
-CVE_STATUS[CVE-2019-19529] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-19530] =3D "fixed-version: Fixed from version 5.3rc5=
"
-
-CVE_STATUS[CVE-2019-19531] =3D "fixed-version: Fixed from version 5.3rc4=
"
-
-CVE_STATUS[CVE-2019-19532] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-CVE_STATUS[CVE-2019-19533] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19534] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-19535] =3D "fixed-version: Fixed from version 5.3rc4=
"
-
-CVE_STATUS[CVE-2019-19536] =3D "fixed-version: Fixed from version 5.3rc4=
"
-
-CVE_STATUS[CVE-2019-19537] =3D "fixed-version: Fixed from version 5.3rc5=
"
-
-CVE_STATUS[CVE-2019-19543] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-19602] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19767] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2019-19768] =3D "fixed-version: Fixed from version 5.6rc4=
"
-
-CVE_STATUS[CVE-2019-19769] =3D "fixed-version: Fixed from version 5.6rc5=
"
-
-CVE_STATUS[CVE-2019-19770] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2019-19807] =3D "fixed-version: Fixed from version 5.4rc7=
"
-
-CVE_STATUS[CVE-2019-19813] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-# CVE-2019-19814 has no known resolution
-
-CVE_STATUS[CVE-2019-19815] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2019-19816] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-19922] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-19927] =3D "fixed-version: Fixed from version 5.1rc6=
"
-
-CVE_STATUS[CVE-2019-19947] =3D "fixed-version: Fixed from version 5.5rc3=
"
-
-CVE_STATUS[CVE-2019-19965] =3D "fixed-version: Fixed from version 5.5rc2=
"
-
-CVE_STATUS[CVE-2019-19966] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-1999] =3D "fixed-version: Fixed from version 5.1rc3"
-
-CVE_STATUS[CVE-2019-20054] =3D "fixed-version: Fixed from version 5.1rc3=
"
-
-CVE_STATUS[CVE-2019-20095] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-20096] =3D "fixed-version: Fixed from version 5.1rc4=
"
-
-CVE_STATUS[CVE-2019-2024] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2019-2025] =3D "fixed-version: Fixed from version 4.20rc5=
"
-
-CVE_STATUS[CVE-2019-20422] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-2054] =3D "fixed-version: Fixed from version 4.8rc1"
-
-CVE_STATUS[CVE-2019-20636] =3D "fixed-version: Fixed from version 5.5rc6=
"
-
-# CVE-2019-20794 has no known resolution
-
-CVE_STATUS[CVE-2019-20806] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-CVE_STATUS[CVE-2019-20810] =3D "fixed-version: Fixed from version 5.6rc1=
"
-
-CVE_STATUS[CVE-2019-20811] =3D "fixed-version: Fixed from version 5.1rc3=
"
-
-CVE_STATUS[CVE-2019-20812] =3D "fixed-version: Fixed from version 5.5rc3=
"
-
-CVE_STATUS[CVE-2019-20908] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2019-20934] =3D "fixed-version: Fixed from version 5.3rc2=
"
-
-CVE_STATUS[CVE-2019-2101] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-2181] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-2182] =3D "fixed-version: Fixed from version 4.16rc3=
"
-
-CVE_STATUS[CVE-2019-2213] =3D "fixed-version: Fixed from version 5.2rc6"
-
-CVE_STATUS[CVE-2019-2214] =3D "fixed-version: Fixed from version 5.3rc2"
-
-CVE_STATUS[CVE-2019-2215] =3D "fixed-version: Fixed from version 4.16rc1=
"
-
-CVE_STATUS[CVE-2019-25044] =3D "fixed-version: Fixed from version 5.2rc4=
"
-
-CVE_STATUS[CVE-2019-25045] =3D "fixed-version: Fixed from version 5.1"
-
-CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed from version 5.6rc1"
-
-CVE_STATUS[CVE-2019-3459] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-3460] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-3701] =3D "fixed-version: Fixed from version 5.0rc3"
-
-CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed from version 5.0rc6"
-
-CVE_STATUS[CVE-2019-3837] =3D "fixed-version: Fixed from version 3.18rc1=
"
-
-CVE_STATUS[CVE-2019-3846] =3D "fixed-version: Fixed from version 5.2rc6"
-
-CVE_STATUS[CVE-2019-3874] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-3882] =3D "fixed-version: Fixed from version 5.1rc4"
-
-CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed from version 5.1rc4"
-
-CVE_STATUS[CVE-2019-3892] =3D "fixed-version: Fixed from version 5.1rc6"
-
-CVE_STATUS[CVE-2019-3896] =3D "fixed-version: Fixed from version 2.6.35r=
c1"
-
-CVE_STATUS[CVE-2019-3900] =3D "fixed-version: Fixed from version 5.2rc4"
-
-CVE_STATUS[CVE-2019-3901] =3D "fixed-version: Fixed from version 4.6rc6"
-
-CVE_STATUS[CVE-2019-5108] =3D "fixed-version: Fixed from version 5.3"
-
-# Skipping CVE-2019-5489, no affected_versions
-
-CVE_STATUS[CVE-2019-6133] =3D "fixed-version: Fixed from version 5.0rc2"
-
-CVE_STATUS[CVE-2019-6974] =3D "fixed-version: Fixed from version 5.0rc6"
-
-CVE_STATUS[CVE-2019-7221] =3D "fixed-version: Fixed from version 5.0rc6"
-
-CVE_STATUS[CVE-2019-7222] =3D "fixed-version: Fixed from version 5.0rc6"
-
-CVE_STATUS[CVE-2019-7308] =3D "fixed-version: Fixed from version 5.0rc3"
-
-CVE_STATUS[CVE-2019-8912] =3D "fixed-version: Fixed from version 5.0rc8"
-
-CVE_STATUS[CVE-2019-8956] =3D "fixed-version: Fixed from version 5.0rc6"
-
-CVE_STATUS[CVE-2019-8980] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-9003] =3D "fixed-version: Fixed from version 5.0rc4"
-
-CVE_STATUS[CVE-2019-9162] =3D "fixed-version: Fixed from version 5.0rc7"
-
-CVE_STATUS[CVE-2019-9213] =3D "fixed-version: Fixed from version 5.0"
-
-CVE_STATUS[CVE-2019-9245] =3D "fixed-version: Fixed from version 5.0rc1"
-
-CVE_STATUS[CVE-2019-9444] =3D "fixed-version: Fixed from version 4.15rc2=
"
-
-CVE_STATUS[CVE-2019-9445] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-9453] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2019-9454] =3D "fixed-version: Fixed from version 4.15rc9=
"
-
-CVE_STATUS[CVE-2019-9455] =3D "fixed-version: Fixed from version 5.0rc1"
-
-CVE_STATUS[CVE-2019-9456] =3D "fixed-version: Fixed from version 4.16rc6=
"
-
-CVE_STATUS[CVE-2019-9457] =3D "fixed-version: Fixed from version 4.13rc1=
"
-
-CVE_STATUS[CVE-2019-9458] =3D "fixed-version: Fixed from version 4.19rc7=
"
-
-CVE_STATUS[CVE-2019-9466] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-9500] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-9503] =3D "fixed-version: Fixed from version 5.1rc1"
-
-CVE_STATUS[CVE-2019-9506] =3D "fixed-version: Fixed from version 5.2"
-
-CVE_STATUS[CVE-2019-9857] =3D "fixed-version: Fixed from version 5.1rc2"
-
-CVE_STATUS[CVE-2020-0009] =3D "fixed-version: Fixed from version 5.6rc3"
-
-CVE_STATUS[CVE-2020-0030] =3D "fixed-version: Fixed from version 4.16rc3=
"
-
-CVE_STATUS[CVE-2020-0041] =3D "fixed-version: Fixed from version 5.5rc2"
-
-CVE_STATUS[CVE-2020-0066] =3D "fixed-version: Fixed from version 4.3rc7"
-
-CVE_STATUS[CVE-2020-0067] =3D "fixed-version: Fixed from version 5.5rc1"
-
-CVE_STATUS[CVE-2020-0110] =3D "fixed-version: Fixed from version 5.6rc2"
-
-CVE_STATUS[CVE-2020-0255] =3D "fixed-version: Fixed from version 5.7rc4"
-
-CVE_STATUS[CVE-2020-0305] =3D "fixed-version: Fixed from version 5.5rc6"
-
-# CVE-2020-0347 has no known resolution
-
-CVE_STATUS[CVE-2020-0404] =3D "fixed-version: Fixed from version 5.6rc1"
-
-CVE_STATUS[CVE-2020-0423] =3D "fixed-version: Fixed from version 5.10rc1=
"
-
-CVE_STATUS[CVE-2020-0427] =3D "fixed-version: Fixed from version 5.5rc1"
-
-CVE_STATUS[CVE-2020-0429] =3D "fixed-version: Fixed from version 4.14rc4=
"
-
-CVE_STATUS[CVE-2020-0430] =3D "fixed-version: Fixed from version 4.18rc1=
"
-
-CVE_STATUS[CVE-2020-0431] =3D "fixed-version: Fixed from version 5.5rc6"
-
-CVE_STATUS[CVE-2020-0432] =3D "fixed-version: Fixed from version 5.6rc1"
-
-CVE_STATUS[CVE-2020-0433] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2020-0435] =3D "fixed-version: Fixed from version 4.19rc1=
"
-
-CVE_STATUS[CVE-2020-0444] =3D "fixed-version: Fixed from version 5.6rc4"
-
-CVE_STATUS[CVE-2020-0465] =3D "fixed-version: Fixed from version 5.9rc4"
-
-CVE_STATUS[CVE-2020-0466] =3D "fixed-version: Fixed from version 5.9rc2"
-
-CVE_STATUS[CVE-2020-0543] =3D "fixed-version: Fixed from version 5.8rc1"
-
-CVE_STATUS[CVE-2020-10135] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-10690] =3D "fixed-version: Fixed from version 5.5rc5=
"
-
-# CVE-2020-10708 has no known resolution
-
-CVE_STATUS[CVE-2020-10711] =3D "fixed-version: Fixed from version 5.7rc6=
"
-
-CVE_STATUS[CVE-2020-10720] =3D "fixed-version: Fixed from version 5.2rc3=
"
-
-CVE_STATUS[CVE-2020-10732] =3D "fixed-version: Fixed from version 5.7"
-
-CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed from version 3.16rc=
1"
-
-CVE_STATUS[CVE-2020-10751] =3D "fixed-version: Fixed from version 5.7rc4=
"
-
-CVE_STATUS[CVE-2020-10757] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-10766] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-10767] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-10768] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-10769] =3D "fixed-version: Fixed from version 5.0rc3=
"
-
-CVE_STATUS[CVE-2020-10773] =3D "fixed-version: Fixed from version 5.4rc6=
"
-
-# CVE-2020-10774 has no known resolution
-
-CVE_STATUS[CVE-2020-10781] =3D "fixed-version: Fixed from version 5.8rc6=
"
-
-CVE_STATUS[CVE-2020-10942] =3D "fixed-version: Fixed from version 5.6rc4=
"
-
-CVE_STATUS[CVE-2020-11494] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-11565] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-11608] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-11609] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-11668] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-11669] =3D "fixed-version: Fixed from version 5.2rc1=
"
-
-# CVE-2020-11725 has no known resolution
-
-CVE_STATUS[CVE-2020-11884] =3D "fixed-version: Fixed from version 5.7rc4=
"
-
-# CVE-2020-11935 has no known resolution
-
-CVE_STATUS[CVE-2020-12114] =3D "fixed-version: Fixed from version 5.3rc1=
"
-
-CVE_STATUS[CVE-2020-12351] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-12352] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-12362] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-12363] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-12364] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-12464] =3D "fixed-version: Fixed from version 5.7rc3=
"
-
-CVE_STATUS[CVE-2020-12465] =3D "fixed-version: Fixed from version 5.6rc6=
"
-
-CVE_STATUS[CVE-2020-12652] =3D "fixed-version: Fixed from version 5.5rc7=
"
-
-CVE_STATUS[CVE-2020-12653] =3D "fixed-version: Fixed from version 5.6rc1=
"
-
-CVE_STATUS[CVE-2020-12654] =3D "fixed-version: Fixed from version 5.6rc1=
"
-
-CVE_STATUS[CVE-2020-12655] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-12656] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-12657] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-12659] =3D "fixed-version: Fixed from version 5.7rc2=
"
-
-CVE_STATUS[CVE-2020-12768] =3D "fixed-version: Fixed from version 5.6rc4=
"
-
-CVE_STATUS[CVE-2020-12769] =3D "fixed-version: Fixed from version 5.5rc6=
"
-
-CVE_STATUS[CVE-2020-12770] =3D "fixed-version: Fixed from version 5.7rc3=
"
-
-CVE_STATUS[CVE-2020-12771] =3D "fixed-version: Fixed from version 5.8rc2=
"
-
-CVE_STATUS[CVE-2020-12826] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-12888] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-12912] =3D "fixed-version: Fixed from version 5.10rc=
4"
-
-CVE_STATUS[CVE-2020-13143] =3D "fixed-version: Fixed from version 5.7rc6=
"
-
-CVE_STATUS[CVE-2020-13974] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-# CVE-2020-14304 has no known resolution
-
-CVE_STATUS[CVE-2020-14305] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-CVE_STATUS[CVE-2020-14314] =3D "fixed-version: Fixed from version 5.9rc2=
"
-
-CVE_STATUS[CVE-2020-14331] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2020-14351] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-14353] =3D "fixed-version: Fixed from version 4.14rc=
3"
-
-CVE_STATUS[CVE-2020-14356] =3D "fixed-version: Fixed from version 5.8rc5=
"
-
-CVE_STATUS[CVE-2020-14381] =3D "fixed-version: Fixed from version 5.6rc6=
"
-
-CVE_STATUS[CVE-2020-14385] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2020-14386] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2020-14390] =3D "fixed-version: Fixed from version 5.9rc6=
"
-
-CVE_STATUS[CVE-2020-14416] =3D "fixed-version: Fixed from version 5.5"
-
-CVE_STATUS[CVE-2020-15393] =3D "fixed-version: Fixed from version 5.8rc3=
"
-
-CVE_STATUS[CVE-2020-15436] =3D "fixed-version: Fixed from version 5.8rc2=
"
-
-CVE_STATUS[CVE-2020-15437] =3D "fixed-version: Fixed from version 5.8rc7=
"
-
-CVE_STATUS[CVE-2020-15780] =3D "fixed-version: Fixed from version 5.8rc3=
"
-
-# CVE-2020-15802 has no known resolution
-
-CVE_STATUS[CVE-2020-15852] =3D "fixed-version: Fixed from version 5.8rc6=
"
-
-CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed from version 5.15rc=
2"
-
-CVE_STATUS[CVE-2020-16120] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-16166] =3D "fixed-version: Fixed from version 5.8"
-
-CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed from version 5.5rc1"
-
-CVE_STATUS[CVE-2020-24394] =3D "fixed-version: Fixed from version 5.8rc4=
"
-
-CVE_STATUS[CVE-2020-24490] =3D "fixed-version: Fixed from version 5.8"
-
-# CVE-2020-24502 has no known resolution
-
-# CVE-2020-24503 has no known resolution
-
-CVE_STATUS[CVE-2020-24504] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2020-24586] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2020-24587] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2020-24588] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2020-25211] =3D "fixed-version: Fixed from version 5.9rc7=
"
-
-CVE_STATUS[CVE-2020-25212] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-# CVE-2020-25220 has no known resolution
-
-CVE_STATUS[CVE-2020-25221] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2020-25284] =3D "fixed-version: Fixed from version 5.9rc5=
"
-
-CVE_STATUS[CVE-2020-25285] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2020-25639] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2020-25641] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2020-25643] =3D "fixed-version: Fixed from version 5.9rc7=
"
-
-CVE_STATUS[CVE-2020-25645] =3D "fixed-version: Fixed from version 5.9rc7=
"
-
-CVE_STATUS[CVE-2020-25656] =3D "fixed-version: Fixed from version 5.10rc=
2"
-
-# CVE-2020-25661 has no known resolution
-
-# CVE-2020-25662 has no known resolution
-
-CVE_STATUS[CVE-2020-25668] =3D "fixed-version: Fixed from version 5.10rc=
3"
-
-CVE_STATUS[CVE-2020-25669] =3D "fixed-version: Fixed from version 5.10rc=
5"
-
-CVE_STATUS[CVE-2020-25670] =3D "fixed-version: Fixed from version 5.12rc=
7"
-
-CVE_STATUS[CVE-2020-25671] =3D "fixed-version: Fixed from version 5.12rc=
7"
-
-CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed from version 5.12rc=
7"
-
-CVE_STATUS[CVE-2020-25673] =3D "fixed-version: Fixed from version 5.12rc=
7"
-
-CVE_STATUS[CVE-2020-25704] =3D "fixed-version: Fixed from version 5.10rc=
3"
-
-CVE_STATUS[CVE-2020-25705] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-26088] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2020-26139] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-# CVE-2020-26140 has no known resolution
-
-CVE_STATUS[CVE-2020-26141] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-# CVE-2020-26142 has no known resolution
-
-# CVE-2020-26143 has no known resolution
-
-CVE_STATUS[CVE-2020-26145] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2020-26147] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2020-26541] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2020-26555] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-# CVE-2020-26556 has no known resolution
-
-# CVE-2020-26557 has no known resolution
-
-CVE_STATUS[CVE-2020-26558] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-# CVE-2020-26559 has no known resolution
-
-# CVE-2020-26560 has no known resolution
-
-CVE_STATUS[CVE-2020-27066] =3D "fixed-version: Fixed from version 5.6"
-
-CVE_STATUS[CVE-2020-27067] =3D "fixed-version: Fixed from version 4.14rc=
4"
-
-CVE_STATUS[CVE-2020-27068] =3D "fixed-version: Fixed from version 5.6rc2=
"
-
-CVE_STATUS[CVE-2020-27152] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27170] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2020-27171] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixed from version 5.9"
-
-CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed from version 5.6rc4"
-
-CVE_STATUS[CVE-2020-27418] =3D "fixed-version: Fixed from version 5.6rc5=
"
-
-CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27777] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27784] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27786] =3D "fixed-version: Fixed from version 5.7rc6=
"
-
-CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-27820] =3D "fixed-version: Fixed from version 5.16rc=
1"
-
-CVE_STATUS[CVE-2020-27825] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-27830] =3D "fixed-version: Fixed from version 5.10rc=
7"
-
-CVE_STATUS[CVE-2020-27835] =3D "fixed-version: Fixed from version 5.10rc=
6"
-
-CVE_STATUS[CVE-2020-28097] =3D "fixed-version: Fixed from version 5.9rc6=
"
-
-CVE_STATUS[CVE-2020-28374] =3D "fixed-version: Fixed from version 5.11rc=
4"
-
-CVE_STATUS[CVE-2020-28588] =3D "fixed-version: Fixed from version 5.10rc=
7"
-
-CVE_STATUS[CVE-2020-28915] =3D "fixed-version: Fixed from version 5.9"
-
-CVE_STATUS[CVE-2020-28941] =3D "fixed-version: Fixed from version 5.10rc=
5"
-
-CVE_STATUS[CVE-2020-28974] =3D "fixed-version: Fixed from version 5.10rc=
3"
-
-CVE_STATUS[CVE-2020-29368] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-29369] =3D "fixed-version: Fixed from version 5.8rc7=
"
-
-CVE_STATUS[CVE-2020-29370] =3D "fixed-version: Fixed from version 5.6rc7=
"
-
-CVE_STATUS[CVE-2020-29371] =3D "fixed-version: Fixed from version 5.9rc2=
"
-
-CVE_STATUS[CVE-2020-29372] =3D "fixed-version: Fixed from version 5.7rc3=
"
-
-CVE_STATUS[CVE-2020-29373] =3D "fixed-version: Fixed from version 5.6rc2=
"
-
-CVE_STATUS[CVE-2020-29374] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-29534] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-29568] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-29569] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-29660] =3D "fixed-version: Fixed from version 5.10rc=
7"
-
-CVE_STATUS[CVE-2020-29661] =3D "fixed-version: Fixed from version 5.10rc=
7"
-
-CVE_STATUS[CVE-2020-35499] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-# CVE-2020-35501 has no known resolution
-
-CVE_STATUS[CVE-2020-35508] =3D "fixed-version: Fixed from version 5.10rc=
3"
-
-CVE_STATUS[CVE-2020-35513] =3D "fixed-version: Fixed from version 4.17rc=
1"
-
-CVE_STATUS[CVE-2020-35519] =3D "fixed-version: Fixed from version 5.10rc=
7"
-
-CVE_STATUS[CVE-2020-36158] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-36310] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-36311] =3D "fixed-version: Fixed from version 5.9rc5=
"
-
-CVE_STATUS[CVE-2020-36312] =3D "fixed-version: Fixed from version 5.9rc5=
"
-
-CVE_STATUS[CVE-2020-36313] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-36322] =3D "fixed-version: Fixed from version 5.11rc=
1"
-
-CVE_STATUS[CVE-2020-36385] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2020-36386] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2020-36387] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2020-36516] =3D "fixed-version: Fixed from version 5.17rc=
2"
-
-CVE_STATUS[CVE-2020-36557] =3D "fixed-version: Fixed from version 5.7rc1=
"
-
-CVE_STATUS[CVE-2020-36558] =3D "fixed-version: Fixed from version 5.6rc3=
"
-
-CVE_STATUS[CVE-2020-36691] =3D "fixed-version: Fixed from version 5.8rc1=
"
-
-CVE_STATUS[CVE-2020-36694] =3D "fixed-version: Fixed from version 5.10"
-
-CVE_STATUS[CVE-2020-36766] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2020-3702] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2020-4788] =3D "fixed-version: Fixed from version 5.10rc5=
"
-
-CVE_STATUS[CVE-2020-7053] =3D "fixed-version: Fixed from version 5.2rc1"
-
-CVE_STATUS[CVE-2020-8428] =3D "fixed-version: Fixed from version 5.5"
-
-CVE_STATUS[CVE-2020-8647] =3D "fixed-version: Fixed from version 5.6rc5"
-
-CVE_STATUS[CVE-2020-8648] =3D "fixed-version: Fixed from version 5.6rc3"
-
-CVE_STATUS[CVE-2020-8649] =3D "fixed-version: Fixed from version 5.6rc5"
-
-CVE_STATUS[CVE-2020-8694] =3D "fixed-version: Fixed from version 5.10rc4=
"
-
-# CVE-2020-8832 has no known resolution
-
-CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed from version 4.18rc1=
"
-
-CVE_STATUS[CVE-2020-8835] =3D "fixed-version: Fixed from version 5.7rc1"
-
-CVE_STATUS[CVE-2020-8992] =3D "fixed-version: Fixed from version 5.6rc2"
-
-CVE_STATUS[CVE-2020-9383] =3D "fixed-version: Fixed from version 5.6rc4"
-
-CVE_STATUS[CVE-2020-9391] =3D "fixed-version: Fixed from version 5.6rc3"
-
-CVE_STATUS[CVE-2021-0129] =3D "fixed-version: Fixed from version 5.13rc1=
"
-
-CVE_STATUS[CVE-2021-0342] =3D "fixed-version: Fixed from version 5.8rc1"
-
-# CVE-2021-0399 has no known resolution
-
-CVE_STATUS[CVE-2021-0447] =3D "fixed-version: Fixed from version 4.15rc1=
"
-
-CVE_STATUS[CVE-2021-0448] =3D "fixed-version: Fixed from version 5.9rc7"
-
-CVE_STATUS[CVE-2021-0512] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2021-0605] =3D "fixed-version: Fixed from version 5.8"
-
-# CVE-2021-0606 has no known resolution
-
-# CVE-2021-0695 has no known resolution
-
-CVE_STATUS[CVE-2021-0707] =3D "fixed-version: Fixed from version 5.11rc3=
"
-
-CVE_STATUS[CVE-2021-0920] =3D "fixed-version: Fixed from version 5.14rc4=
"
-
-# CVE-2021-0924 has no known resolution
-
-CVE_STATUS[CVE-2021-0929] =3D "fixed-version: Fixed from version 5.6rc1"
-
-CVE_STATUS[CVE-2021-0935] =3D "fixed-version: Fixed from version 4.16rc7=
"
-
-# CVE-2021-0936 has no known resolution
-
-CVE_STATUS[CVE-2021-0937] =3D "fixed-version: Fixed from version 5.12rc8=
"
-
-CVE_STATUS[CVE-2021-0938] =3D "fixed-version: Fixed from version 5.10rc4=
"
-
-CVE_STATUS[CVE-2021-0941] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-# CVE-2021-0961 has no known resolution
-
-CVE_STATUS[CVE-2021-1048] =3D "fixed-version: Fixed from version 5.9rc4"
-
-CVE_STATUS[CVE-2021-20177] =3D "fixed-version: Fixed from version 5.5rc1=
"
-
-CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-# CVE-2021-20219 has no known resolution
-
-CVE_STATUS[CVE-2021-20226] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2021-20239] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2021-20261] =3D "fixed-version: Fixed from version 4.5rc5=
"
-
-CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed from version 4.5rc3=
"
-
-CVE_STATUS[CVE-2021-20268] =3D "fixed-version: Fixed from version 5.11rc=
5"
-
-CVE_STATUS[CVE-2021-20292] =3D "fixed-version: Fixed from version 5.9rc1=
"
-
-CVE_STATUS[CVE-2021-20317] =3D "fixed-version: Fixed from version 5.4rc1=
"
-
-CVE_STATUS[CVE-2021-20320] =3D "fixed-version: Fixed from version 5.15rc=
3"
-
-CVE_STATUS[CVE-2021-20321] =3D "fixed-version: Fixed from version 5.15rc=
5"
-
-CVE_STATUS[CVE-2021-20322] =3D "fixed-version: Fixed from version 5.15rc=
1"
-
-CVE_STATUS[CVE-2021-21781] =3D "fixed-version: Fixed from version 5.11rc=
7"
-
-CVE_STATUS[CVE-2021-22543] =3D "fixed-version: Fixed from version 5.13"
-
-CVE_STATUS[CVE-2021-22555] =3D "fixed-version: Fixed from version 5.12rc=
8"
-
-CVE_STATUS[CVE-2021-22600] =3D "fixed-version: Fixed from version 5.16rc=
6"
-
-CVE_STATUS[CVE-2021-23133] =3D "fixed-version: Fixed from version 5.12rc=
8"
-
-CVE_STATUS[CVE-2021-23134] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-26401] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2021-26708] =3D "fixed-version: Fixed from version 5.11rc=
7"
-
-CVE_STATUS[CVE-2021-26930] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2021-26931] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2021-26932] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-# CVE-2021-26934 has no known resolution
-
-CVE_STATUS[CVE-2021-27363] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-27364] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-27365] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-28038] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-28039] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-28375] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-28660] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-28688] =3D "fixed-version: Fixed from version 5.12rc=
6"
-
-CVE_STATUS[CVE-2021-28691] =3D "fixed-version: Fixed from version 5.13rc=
6"
-
-CVE_STATUS[CVE-2021-28711] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-28712] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-28713] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-28714] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-28715] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-28950] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-28951] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-28952] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-28964] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-28971] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-28972] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-29154] =3D "fixed-version: Fixed from version 5.12rc=
7"
-
-CVE_STATUS[CVE-2021-29155] =3D "fixed-version: Fixed from version 5.12rc=
8"
-
-CVE_STATUS[CVE-2021-29264] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-29265] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-29266] =3D "fixed-version: Fixed from version 5.12rc=
4"
-
-CVE_STATUS[CVE-2021-29646] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-29647] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-29648] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-29649] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-29650] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-29657] =3D "fixed-version: Fixed from version 5.12rc=
6"
-
-CVE_STATUS[CVE-2021-30002] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2021-30178] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2021-31440] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-3178] =3D "fixed-version: Fixed from version 5.11rc5=
"
-
-CVE_STATUS[CVE-2021-31829] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-31916] =3D "fixed-version: Fixed from version 5.12rc=
5"
-
-CVE_STATUS[CVE-2021-32078] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-32399] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-32606] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2021-33033] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-33034] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-33061] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2021-33098] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2021-33135] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2021-33200] =3D "fixed-version: Fixed from version 5.13rc=
4"
-
-CVE_STATUS[CVE-2021-3347] =3D "fixed-version: Fixed from version 5.11rc6=
"
-
-CVE_STATUS[CVE-2021-3348] =3D "fixed-version: Fixed from version 5.11rc6=
"
-
-CVE_STATUS[CVE-2021-33624] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2021-33655] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2021-33656] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2021-33909] =3D "fixed-version: Fixed from version 5.14rc=
3"
-
-CVE_STATUS[CVE-2021-3411] =3D "fixed-version: Fixed from version 5.10"
-
-CVE_STATUS[CVE-2021-3428] =3D "fixed-version: Fixed from version 5.9rc2"
-
-CVE_STATUS[CVE-2021-3444] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2021-34556] =3D "fixed-version: Fixed from version 5.14rc=
4"
-
-CVE_STATUS[CVE-2021-34693] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2021-3483] =3D "fixed-version: Fixed from version 5.12rc6=
"
-
-CVE_STATUS[CVE-2021-34866] =3D "fixed-version: Fixed from version 5.14"
-
-CVE_STATUS[CVE-2021-3489] =3D "fixed-version: Fixed from version 5.13rc4=
"
-
-CVE_STATUS[CVE-2021-3490] =3D "fixed-version: Fixed from version 5.13rc4=
"
-
-CVE_STATUS[CVE-2021-3491] =3D "fixed-version: Fixed from version 5.13rc1=
"
-
-# CVE-2021-3492 has no known resolution
-
-CVE_STATUS[CVE-2021-3493] =3D "fixed-version: Fixed from version 5.11rc1=
"
-
-CVE_STATUS[CVE-2021-34981] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-3501] =3D "fixed-version: Fixed from version 5.12rc8=
"
-
-CVE_STATUS[CVE-2021-35039] =3D "fixed-version: Fixed from version 5.13"
-
-CVE_STATUS[CVE-2021-3506] =3D "fixed-version: Fixed from version 5.13rc1=
"
-
-# CVE-2021-3542 has no known resolution
-
-CVE_STATUS[CVE-2021-3543] =3D "fixed-version: Fixed from version 5.13rc1=
"
-
-CVE_STATUS[CVE-2021-35477] =3D "fixed-version: Fixed from version 5.14rc=
4"
-
-CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed from version 5.13rc5=
"
-
-CVE_STATUS[CVE-2021-3573] =3D "fixed-version: Fixed from version 5.13rc5=
"
-
-CVE_STATUS[CVE-2021-3587] =3D "fixed-version: Fixed from version 5.13rc5=
"
-
-CVE_STATUS[CVE-2021-3600] =3D "fixed-version: Fixed from version 5.11"
-
-CVE_STATUS[CVE-2021-3609] =3D "fixed-version: Fixed from version 5.14rc1=
"
-
-CVE_STATUS[CVE-2021-3612] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2021-3635] =3D "fixed-version: Fixed from version 5.5rc7"
-
-CVE_STATUS[CVE-2021-3640] =3D "fixed-version: Fixed from version 5.16rc1=
"
-
-CVE_STATUS[CVE-2021-3653] =3D "fixed-version: Fixed from version 5.14rc7=
"
-
-CVE_STATUS[CVE-2021-3655] =3D "fixed-version: Fixed from version 5.14rc1=
"
-
-CVE_STATUS[CVE-2021-3656] =3D "fixed-version: Fixed from version 5.14rc7=
"
-
-CVE_STATUS[CVE-2021-3659] =3D "fixed-version: Fixed from version 5.12rc7=
"
-
-CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-3679] =3D "fixed-version: Fixed from version 5.14rc3=
"
-
-# CVE-2021-3714 has no known resolution
-
-CVE_STATUS[CVE-2021-3715] =3D "fixed-version: Fixed from version 5.6"
-
-CVE_STATUS[CVE-2021-37159] =3D "fixed-version: Fixed from version 5.14rc=
3"
-
-CVE_STATUS[CVE-2021-3732] =3D "fixed-version: Fixed from version 5.14rc6=
"
-
-CVE_STATUS[CVE-2021-3736] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-3739] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-3743] =3D "fixed-version: Fixed from version 5.13rc7=
"
-
-CVE_STATUS[CVE-2021-3744] =3D "fixed-version: Fixed from version 5.15rc4=
"
-
-CVE_STATUS[CVE-2021-3752] =3D "fixed-version: Fixed from version 5.16rc1=
"
-
-CVE_STATUS[CVE-2021-3753] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-37576] =3D "fixed-version: Fixed from version 5.14rc=
3"
-
-CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-3760] =3D "fixed-version: Fixed from version 5.15rc6=
"
-
-CVE_STATUS[CVE-2021-3764] =3D "fixed-version: Fixed from version 5.15rc4=
"
-
-CVE_STATUS[CVE-2021-3772] =3D "fixed-version: Fixed from version 5.15"
-
-CVE_STATUS[CVE-2021-38160] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-38166] =3D "fixed-version: Fixed from version 5.14rc=
6"
-
-CVE_STATUS[CVE-2021-38198] =3D "fixed-version: Fixed from version 5.13rc=
6"
-
-CVE_STATUS[CVE-2021-38199] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-38200] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2021-38201] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-38202] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-38203] =3D "fixed-version: Fixed from version 5.14rc=
2"
-
-CVE_STATUS[CVE-2021-38204] =3D "fixed-version: Fixed from version 5.14rc=
3"
-
-CVE_STATUS[CVE-2021-38205] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-38206] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2021-38207] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2021-38208] =3D "fixed-version: Fixed from version 5.13rc=
5"
-
-CVE_STATUS[CVE-2021-38209] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-38300] =3D "fixed-version: Fixed from version 5.15rc=
4"
-
-# CVE-2021-3847 has no known resolution
-
-# CVE-2021-3864 has no known resolution
-
-# CVE-2021-3892 has no known resolution
-
-CVE_STATUS[CVE-2021-3894] =3D "fixed-version: Fixed from version 5.15rc6=
"
-
-CVE_STATUS[CVE-2021-3896] =3D "fixed-version: Fixed from version 5.15rc6=
"
-
-CVE_STATUS[CVE-2021-3923] =3D "fixed-version: Fixed from version 5.16"
-
-CVE_STATUS[CVE-2021-39633] =3D "fixed-version: Fixed from version 5.14"
-
-CVE_STATUS[CVE-2021-39634] =3D "fixed-version: Fixed from version 5.9rc8=
"
-
-CVE_STATUS[CVE-2021-39636] =3D "fixed-version: Fixed from version 4.16rc=
1"
-
-CVE_STATUS[CVE-2021-39648] =3D "fixed-version: Fixed from version 5.11rc=
3"
-
-CVE_STATUS[CVE-2021-39656] =3D "fixed-version: Fixed from version 5.12rc=
3"
-
-CVE_STATUS[CVE-2021-39657] =3D "fixed-version: Fixed from version 5.11rc=
4"
-
-CVE_STATUS[CVE-2021-39685] =3D "fixed-version: Fixed from version 5.16rc=
5"
-
-CVE_STATUS[CVE-2021-39686] =3D "fixed-version: Fixed from version 5.16rc=
1"
-
-CVE_STATUS[CVE-2021-39698] =3D "fixed-version: Fixed from version 5.16rc=
5"
-
-CVE_STATUS[CVE-2021-39711] =3D "fixed-version: Fixed from version 4.18rc=
6"
-
-CVE_STATUS[CVE-2021-39713] =3D "fixed-version: Fixed from version 4.20rc=
1"
-
-CVE_STATUS[CVE-2021-39714] =3D "fixed-version: Fixed from version 4.12rc=
1"
-
-# CVE-2021-39800 has no known resolution
-
-# CVE-2021-39801 has no known resolution
-
-# CVE-2021-39802 has no known resolution
-
-CVE_STATUS[CVE-2021-4001] =3D "fixed-version: Fixed from version 5.16rc2=
"
-
-CVE_STATUS[CVE-2021-4002] =3D "fixed-version: Fixed from version 5.16rc3=
"
-
-CVE_STATUS[CVE-2021-4023] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2021-4028] =3D "fixed-version: Fixed from version 5.15rc4=
"
-
-CVE_STATUS[CVE-2021-4032] =3D "fixed-version: Fixed from version 5.15rc7=
"
-
-CVE_STATUS[CVE-2021-4037] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2021-40490] =3D "fixed-version: Fixed from version 5.15rc=
1"
-
-CVE_STATUS[CVE-2021-4083] =3D "fixed-version: Fixed from version 5.16rc4=
"
-
-CVE_STATUS[CVE-2021-4090] =3D "fixed-version: Fixed from version 5.16rc2=
"
-
-CVE_STATUS[CVE-2021-4093] =3D "fixed-version: Fixed from version 5.15rc7=
"
-
-CVE_STATUS[CVE-2021-4095] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2021-41073] =3D "fixed-version: Fixed from version 5.15rc=
2"
-
-CVE_STATUS[CVE-2021-4135] =3D "fixed-version: Fixed from version 5.16rc6=
"
-
-CVE_STATUS[CVE-2021-4148] =3D "fixed-version: Fixed from version 5.15"
-
-CVE_STATUS[CVE-2021-4149] =3D "fixed-version: Fixed from version 5.15rc6=
"
-
-CVE_STATUS[CVE-2021-4150] =3D "fixed-version: Fixed from version 5.15rc7=
"
-
-CVE_STATUS[CVE-2021-4154] =3D "fixed-version: Fixed from version 5.14rc2=
"
-
-CVE_STATUS[CVE-2021-4155] =3D "fixed-version: Fixed from version 5.16"
-
-CVE_STATUS[CVE-2021-4157] =3D "fixed-version: Fixed from version 5.13rc1=
"
-
-CVE_STATUS[CVE-2021-4159] =3D "fixed-version: Fixed from version 5.7rc1"
-
-CVE_STATUS[CVE-2021-41864] =3D "fixed-version: Fixed from version 5.15rc=
5"
-
-CVE_STATUS[CVE-2021-4197] =3D "fixed-version: Fixed from version 5.16"
-
-CVE_STATUS[CVE-2021-42008] =3D "fixed-version: Fixed from version 5.14rc=
7"
-
-CVE_STATUS[CVE-2021-4202] =3D "fixed-version: Fixed from version 5.16rc2=
"
-
-CVE_STATUS[CVE-2021-4203] =3D "fixed-version: Fixed from version 5.15rc4=
"
-
-CVE_STATUS[CVE-2021-4204] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed from version 5.8rc1"
-
-CVE_STATUS[CVE-2021-42252] =3D "fixed-version: Fixed from version 5.15rc=
1"
-
-CVE_STATUS[CVE-2021-42327] =3D "fixed-version: Fixed from version 5.15"
-
-CVE_STATUS[CVE-2021-42739] =3D "fixed-version: Fixed from version 5.16rc=
1"
-
-CVE_STATUS[CVE-2021-43056] =3D "fixed-version: Fixed from version 5.15rc=
6"
-
-CVE_STATUS[CVE-2021-43057] =3D "fixed-version: Fixed from version 5.15rc=
3"
-
-CVE_STATUS[CVE-2021-43267] =3D "fixed-version: Fixed from version 5.15"
-
-CVE_STATUS[CVE-2021-43389] =3D "fixed-version: Fixed from version 5.15rc=
6"
-
-CVE_STATUS[CVE-2021-43975] =3D "fixed-version: Fixed from version 5.16rc=
2"
-
-CVE_STATUS[CVE-2021-43976] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2021-44733] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-44879] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2021-45095] =3D "fixed-version: Fixed from version 5.16rc=
6"
-
-CVE_STATUS[CVE-2021-45100] =3D "fixed-version: Fixed from version 5.16rc=
7"
-
-CVE_STATUS[CVE-2021-45402] =3D "fixed-version: Fixed from version 5.16rc=
6"
-
-CVE_STATUS[CVE-2021-45469] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2021-45480] =3D "fixed-version: Fixed from version 5.16rc=
6"
-
-CVE_STATUS[CVE-2021-45485] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2021-45486] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2021-45868] =3D "fixed-version: Fixed from version 5.16rc=
1"
-
-CVE_STATUS[CVE-2021-46283] =3D "fixed-version: Fixed from version 5.13rc=
7"
-
-CVE_STATUS[CVE-2022-0001] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-0002] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-0168] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-0171] =3D "fixed-version: Fixed from version 5.18rc4=
"
-
-CVE_STATUS[CVE-2022-0185] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-0264] =3D "fixed-version: Fixed from version 5.16rc6=
"
-
-CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed from version 5.14rc2=
"
-
-CVE_STATUS[CVE-2022-0322] =3D "fixed-version: Fixed from version 5.15rc6=
"
-
-CVE_STATUS[CVE-2022-0330] =3D "fixed-version: Fixed from version 5.17rc2=
"
-
-CVE_STATUS[CVE-2022-0382] =3D "fixed-version: Fixed from version 5.16"
-
-# CVE-2022-0400 has no known resolution
-
-CVE_STATUS[CVE-2022-0433] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-0435] =3D "fixed-version: Fixed from version 5.17rc4=
"
-
-CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2022-0487] =3D "fixed-version: Fixed from version 5.17rc4=
"
-
-CVE_STATUS[CVE-2022-0492] =3D "fixed-version: Fixed from version 5.17rc3=
"
-
-CVE_STATUS[CVE-2022-0494] =3D "fixed-version: Fixed from version 5.17rc5=
"
-
-CVE_STATUS[CVE-2022-0500] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-0516] =3D "fixed-version: Fixed from version 5.17rc4=
"
-
-CVE_STATUS[CVE-2022-0617] =3D "fixed-version: Fixed from version 5.17rc2=
"
-
-CVE_STATUS[CVE-2022-0644] =3D "fixed-version: Fixed from version 5.15rc7=
"
-
-CVE_STATUS[CVE-2022-0646] =3D "fixed-version: Fixed from version 5.17rc5=
"
-
-CVE_STATUS[CVE-2022-0742] =3D "fixed-version: Fixed from version 5.17rc7=
"
-
-CVE_STATUS[CVE-2022-0812] =3D "fixed-version: Fixed from version 5.8rc6"
-
-CVE_STATUS[CVE-2022-0847] =3D "fixed-version: Fixed from version 5.17rc6=
"
-
-CVE_STATUS[CVE-2022-0850] =3D "fixed-version: Fixed from version 5.14rc1=
"
-
-CVE_STATUS[CVE-2022-0854] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-0995] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-0998] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-1011] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-1012] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2022-1015] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1016] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1043] =3D "fixed-version: Fixed from version 5.14rc7=
"
-
-CVE_STATUS[CVE-2022-1048] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1055] =3D "fixed-version: Fixed from version 5.17rc3=
"
-
-# CVE-2022-1116 has no known resolution
-
-CVE_STATUS[CVE-2022-1158] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1184] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1195] =3D "fixed-version: Fixed from version 5.16rc7=
"
-
-CVE_STATUS[CVE-2022-1198] =3D "fixed-version: Fixed from version 5.17rc6=
"
-
-CVE_STATUS[CVE-2022-1199] =3D "fixed-version: Fixed from version 5.17rc8=
"
-
-CVE_STATUS[CVE-2022-1204] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1205] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-# CVE-2022-1247 has no known resolution
-
-CVE_STATUS[CVE-2022-1263] =3D "fixed-version: Fixed from version 5.18rc3=
"
-
-CVE_STATUS[CVE-2022-1280] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2022-1353] =3D "fixed-version: Fixed from version 5.17"
-
-CVE_STATUS[CVE-2022-1419] =3D "fixed-version: Fixed from version 5.6rc2"
-
-CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed from version 5.19rc7=
"
-
-CVE_STATUS[CVE-2022-1508] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2022-1516] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1651] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1652] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2022-1671] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-1678] =3D "fixed-version: Fixed from version 4.20rc1=
"
-
-CVE_STATUS[CVE-2022-1679] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-1729] =3D "fixed-version: Fixed from version 5.18"
-
-CVE_STATUS[CVE-2022-1734] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2022-1786] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2022-1789] =3D "fixed-version: Fixed from version 5.18"
-
-CVE_STATUS[CVE-2022-1836] =3D "fixed-version: Fixed from version 5.18rc5=
"
-
-CVE_STATUS[CVE-2022-1852] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1882] =3D "fixed-version: Fixed from version 5.19rc8=
"
-
-CVE_STATUS[CVE-2022-1943] =3D "fixed-version: Fixed from version 5.18rc7=
"
-
-CVE_STATUS[CVE-2022-1966] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1972] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1973] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1974] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2022-1975] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2022-1976] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-1998] =3D "fixed-version: Fixed from version 5.17rc3=
"
-
-CVE_STATUS[CVE-2022-20008] =3D "fixed-version: Fixed from version 5.17rc=
5"
-
-CVE_STATUS[CVE-2022-20132] =3D "fixed-version: Fixed from version 5.16rc=
5"
-
-CVE_STATUS[CVE-2022-20141] =3D "fixed-version: Fixed from version 5.15rc=
1"
-
-CVE_STATUS[CVE-2022-20148] =3D "fixed-version: Fixed from version 5.16rc=
1"
-
-CVE_STATUS[CVE-2022-20153] =3D "fixed-version: Fixed from version 5.13rc=
1"
-
-CVE_STATUS[CVE-2022-20154] =3D "fixed-version: Fixed from version 5.16rc=
8"
-
-CVE_STATUS[CVE-2022-20158] =3D "fixed-version: Fixed from version 5.17"
-
-CVE_STATUS[CVE-2022-20166] =3D "fixed-version: Fixed from version 5.10rc=
1"
-
-CVE_STATUS[CVE-2022-20368] =3D "fixed-version: Fixed from version 5.17"
-
-CVE_STATUS[CVE-2022-20369] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-20409] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2022-20421] =3D "fixed-version: Fixed from version 6.0rc4=
"
-
-CVE_STATUS[CVE-2022-20422] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-20423] =3D "fixed-version: Fixed from version 5.17"
-
-CVE_STATUS[CVE-2022-20424] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2022-20565] =3D "fixed-version: Fixed from version 5.9rc4=
"
-
-CVE_STATUS[CVE-2022-20566] =3D "fixed-version: Fixed from version 5.19"
-
-CVE_STATUS[CVE-2022-20567] =3D "fixed-version: Fixed from version 4.16rc=
5"
-
-CVE_STATUS[CVE-2022-20568] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2022-20572] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-2078] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-21123] =3D "fixed-version: Fixed from version 5.19rc=
3"
-
-CVE_STATUS[CVE-2022-21125] =3D "fixed-version: Fixed from version 5.19rc=
3"
-
-CVE_STATUS[CVE-2022-21166] =3D "fixed-version: Fixed from version 5.19rc=
3"
-
-CVE_STATUS[CVE-2022-21385] =3D "fixed-version: Fixed from version 4.20"
-
-CVE_STATUS[CVE-2022-21499] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-21505] =3D "fixed-version: Fixed from version 5.19rc=
8"
-
-CVE_STATUS[CVE-2022-2153] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-2196] =3D "cpe-stable-backport: Backported in 6.1.14=
"
-
-# CVE-2022-2209 has no known resolution
-
-CVE_STATUS[CVE-2022-22942] =3D "fixed-version: Fixed from version 5.17rc=
2"
-
-CVE_STATUS[CVE-2022-23036] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23037] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23038] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23039] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23040] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23041] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-23042] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed from version 6.0"
-
-CVE_STATUS[CVE-2022-2318] =3D "fixed-version: Fixed from version 5.19rc5=
"
-
-CVE_STATUS[CVE-2022-23222] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2022-2380] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-23816] =3D "fixed-version: Fixed from version 5.19rc=
7"
-
-# CVE-2022-23825 has no known resolution
-
-CVE_STATUS[CVE-2022-23960] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-24122] =3D "fixed-version: Fixed from version 5.17rc=
2"
-
-CVE_STATUS[CVE-2022-24448] =3D "fixed-version: Fixed from version 5.17rc=
2"
-
-CVE_STATUS[CVE-2022-24958] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2022-24959] =3D "fixed-version: Fixed from version 5.17rc=
2"
-
-CVE_STATUS[CVE-2022-2503] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-25258] =3D "fixed-version: Fixed from version 5.17rc=
4"
-
-# CVE-2022-25265 has no known resolution
-
-CVE_STATUS[CVE-2022-25375] =3D "fixed-version: Fixed from version 5.17rc=
4"
-
-CVE_STATUS[CVE-2022-25636] =3D "fixed-version: Fixed from version 5.17rc=
6"
-
-CVE_STATUS[CVE-2022-2585] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-2586] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-2588] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-2590] =3D "fixed-version: Fixed from version 6.0rc3"
-
-CVE_STATUS[CVE-2022-2602] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-26365] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-26373] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-2639] =3D "fixed-version: Fixed from version 5.18rc4=
"
-
-CVE_STATUS[CVE-2022-26490] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed from version 6.0rc5"
-
-# CVE-2022-26878 has no known resolution
-
-CVE_STATUS[CVE-2022-26966] =3D "fixed-version: Fixed from version 5.17rc=
6"
-
-CVE_STATUS[CVE-2022-27223] =3D "fixed-version: Fixed from version 5.17rc=
6"
-
-CVE_STATUS[CVE-2022-27666] =3D "fixed-version: Fixed from version 5.17rc=
8"
-
-CVE_STATUS[CVE-2022-27672] =3D "cpe-stable-backport: Backported in 6.1.1=
2"
-
-CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-27950] =3D "fixed-version: Fixed from version 5.17rc=
5"
-
-CVE_STATUS[CVE-2022-28356] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-28388] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-28389] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-28390] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-2873] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-28796] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-28893] =3D "fixed-version: Fixed from version 5.18rc=
2"
-
-CVE_STATUS[CVE-2022-2905] =3D "fixed-version: Fixed from version 6.0rc4"
-
-CVE_STATUS[CVE-2022-29156] =3D "fixed-version: Fixed from version 5.17rc=
6"
-
-CVE_STATUS[CVE-2022-2938] =3D "fixed-version: Fixed from version 5.17rc2=
"
-
-CVE_STATUS[CVE-2022-29581] =3D "fixed-version: Fixed from version 5.18rc=
4"
-
-CVE_STATUS[CVE-2022-29582] =3D "fixed-version: Fixed from version 5.18rc=
2"
-
-CVE_STATUS[CVE-2022-2959] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-# CVE-2022-2961 has no known resolution
-
-CVE_STATUS[CVE-2022-2964] =3D "fixed-version: Fixed from version 5.17rc4=
"
-
-CVE_STATUS[CVE-2022-2977] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-2978] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-29900] =3D "fixed-version: Fixed from version 5.19rc=
7"
-
-CVE_STATUS[CVE-2022-29901] =3D "fixed-version: Fixed from version 5.19rc=
7"
-
-CVE_STATUS[CVE-2022-2991] =3D "fixed-version: Fixed from version 5.15rc1=
"
-
-CVE_STATUS[CVE-2022-29968] =3D "fixed-version: Fixed from version 5.18rc=
5"
-
-CVE_STATUS[CVE-2022-3028] =3D "fixed-version: Fixed from version 6.0rc3"
-
-CVE_STATUS[CVE-2022-30594] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2022-3061] =3D "fixed-version: Fixed from version 5.18rc5=
"
-
-CVE_STATUS[CVE-2022-3077] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3078] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-3103] =3D "fixed-version: Fixed from version 6.0rc3"
-
-CVE_STATUS[CVE-2022-3104] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3105] =3D "fixed-version: Fixed from version 5.16"
-
-CVE_STATUS[CVE-2022-3106] =3D "fixed-version: Fixed from version 5.16rc6=
"
-
-CVE_STATUS[CVE-2022-3107] =3D "fixed-version: Fixed from version 5.17"
-
-CVE_STATUS[CVE-2022-3108] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-3110] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3111] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-3112] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-3113] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-3114] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3115] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3169] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3170] =3D "fixed-version: Fixed from version 6.0rc4"
-
-CVE_STATUS[CVE-2022-3176] =3D "fixed-version: Fixed from version 5.17rc1=
"
-
-CVE_STATUS[CVE-2022-3202] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-32250] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-32296] =3D "fixed-version: Fixed from version 5.18rc=
6"
-
-# CVE-2022-3238 has no known resolution
-
-CVE_STATUS[CVE-2022-3239] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2022-32981] =3D "fixed-version: Fixed from version 5.19rc=
2"
-
-CVE_STATUS[CVE-2022-3303] =3D "fixed-version: Fixed from version 6.0rc5"
-
-CVE_STATUS[CVE-2022-3344] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2022-33740] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-33741] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-33742] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-33743] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-33744] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-33981] =3D "fixed-version: Fixed from version 5.18rc=
5"
-
-CVE_STATUS[CVE-2022-3424] =3D "cpe-stable-backport: Backported in 6.1.2"
-
-CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-34494] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-34495] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-34918] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-3521] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3522] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3524] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3526] =3D "fixed-version: Fixed from version 5.18rc3=
"
-
-CVE_STATUS[CVE-2022-3531] =3D "cpe-stable-backport: Backported in 6.1.2"
-
-CVE_STATUS[CVE-2022-3532] =3D "cpe-stable-backport: Backported in 6.1.2"
-
-# CVE-2022-3533 has no known resolution
-
-CVE_STATUS[CVE-2022-3534] =3D "cpe-stable-backport: Backported in 6.1.2"
-
-CVE_STATUS[CVE-2022-3535] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3541] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3542] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3543] =3D "fixed-version: Fixed from version 6.1rc1"
-
-# CVE-2022-3544 has no known resolution
-
-CVE_STATUS[CVE-2022-3545] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3564] =3D "fixed-version: Fixed from version 6.1rc4"
-
-CVE_STATUS[CVE-2022-3565] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3577] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3586] =3D "fixed-version: Fixed from version 6.0rc5"
-
-CVE_STATUS[CVE-2022-3594] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3595] =3D "fixed-version: Fixed from version 6.1rc1"
-
-# CVE-2022-3606 has no known resolution
-
-CVE_STATUS[CVE-2022-36123] =3D "fixed-version: Fixed from version 5.19rc=
6"
-
-CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed from version 6.1rc4"
-
-CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3623] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3625] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3628] =3D "fixed-version: Fixed from version 6.1rc5"
-
-CVE_STATUS[CVE-2022-36280] =3D "cpe-stable-backport: Backported in 6.1.4=
"
-
-CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3635] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2022-3640] =3D "fixed-version: Fixed from version 6.1rc4"
-
-# CVE-2022-36402 has no known resolution
-
-# CVE-2022-3642 has no known resolution
-
-CVE_STATUS[CVE-2022-3643] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-3649] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-36879] =3D "fixed-version: Fixed from version 5.19rc=
8"
-
-CVE_STATUS[CVE-2022-36946] =3D "fixed-version: Fixed from version 5.19"
-
-CVE_STATUS[CVE-2022-3707] =3D "cpe-stable-backport: Backported in 6.1.5"
-
-# CVE-2022-38096 has no known resolution
-
-CVE_STATUS[CVE-2022-38457] =3D "cpe-stable-backport: Backported in 6.1.7=
"
-
-CVE_STATUS[CVE-2022-3903] =3D "fixed-version: Fixed from version 6.1rc2"
-
-CVE_STATUS[CVE-2022-3910] =3D "fixed-version: Fixed from version 6.0rc6"
-
-CVE_STATUS[CVE-2022-39188] =3D "fixed-version: Fixed from version 5.19rc=
8"
-
-CVE_STATUS[CVE-2022-39189] =3D "fixed-version: Fixed from version 5.19rc=
2"
-
-CVE_STATUS[CVE-2022-39190] =3D "fixed-version: Fixed from version 6.0rc3=
"
-
-CVE_STATUS[CVE-2022-3977] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2022-39842] =3D "fixed-version: Fixed from version 5.19rc=
4"
-
-CVE_STATUS[CVE-2022-40133] =3D "cpe-stable-backport: Backported in 6.1.7=
"
-
-CVE_STATUS[CVE-2022-40307] =3D "fixed-version: Fixed from version 6.0rc5=
"
-
-CVE_STATUS[CVE-2022-40476] =3D "fixed-version: Fixed from version 5.19rc=
4"
-
-CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed from version 6.0rc4"
-
-CVE_STATUS[CVE-2022-40982] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
-
-CVE_STATUS[CVE-2022-41218] =3D "cpe-stable-backport: Backported in 6.1.4=
"
-
-CVE_STATUS[CVE-2022-41222] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2022-4127] =3D "fixed-version: Fixed from version 5.19rc6=
"
-
-CVE_STATUS[CVE-2022-4128] =3D "fixed-version: Fixed from version 5.19rc7=
"
-
-CVE_STATUS[CVE-2022-4129] =3D "fixed-version: Fixed from version 6.1rc6"
-
-CVE_STATUS[CVE-2022-4139] =3D "fixed-version: Fixed from version 6.1rc8"
-
-CVE_STATUS[CVE-2022-41674] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-# CVE-2022-41848 has no known resolution
-
-CVE_STATUS[CVE-2022-41849] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-41850] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-41858] =3D "fixed-version: Fixed from version 5.18rc=
2"
-
-CVE_STATUS[CVE-2022-42328] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2022-42329] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2022-42432] =3D "fixed-version: Fixed from version 6.0rc7=
"
-
-CVE_STATUS[CVE-2022-4269] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2022-42703] =3D "fixed-version: Fixed from version 6.0rc4=
"
-
-CVE_STATUS[CVE-2022-42719] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-42720] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-42721] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-42722] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed from version 6.1rc4=
"
-
-CVE_STATUS[CVE-2022-42896] =3D "fixed-version: Fixed from version 6.1rc4=
"
-
-CVE_STATUS[CVE-2022-43750] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2022-4378] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2022-4379] =3D "cpe-stable-backport: Backported in 6.1.3"
-
-CVE_STATUS[CVE-2022-4382] =3D "cpe-stable-backport: Backported in 6.1.8"
-
-CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
-
-# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
-
-# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
-
-# CVE-2022-4543 has no known resolution
-
-CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fixed from version 6.1rc7=
"
-
-# CVE-2022-45884 has no known resolution
-
-# CVE-2022-45885 has no known resolution
-
-CVE_STATUS[CVE-2022-45886] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-CVE_STATUS[CVE-2022-45887] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-# CVE-2022-45888 needs backporting (fixed from 6.2rc1)
-
-CVE_STATUS[CVE-2022-45919] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2022-4662] =3D "fixed-version: Fixed from version 6.0rc4"
-
-CVE_STATUS[CVE-2022-4696] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2022-4744] =3D "fixed-version: Fixed from version 5.16rc7=
"
-
-CVE_STATUS[CVE-2022-47518] =3D "fixed-version: Fixed from version 6.1rc8=
"
-
-CVE_STATUS[CVE-2022-47519] =3D "fixed-version: Fixed from version 6.1rc8=
"
-
-CVE_STATUS[CVE-2022-47520] =3D "fixed-version: Fixed from version 6.1rc8=
"
-
-CVE_STATUS[CVE-2022-47521] =3D "fixed-version: Fixed from version 6.1rc8=
"
-
-CVE_STATUS[CVE-2022-47929] =3D "cpe-stable-backport: Backported in 6.1.6=
"
-
-CVE_STATUS[CVE-2022-47938] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-47939] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-47940] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2022-47941] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-47942] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-47943] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2022-47946] =3D "fixed-version: Fixed from version 5.12rc=
2"
-
-CVE_STATUS[CVE-2022-4842] =3D "cpe-stable-backport: Backported in 6.1.8"
-
-CVE_STATUS[CVE-2022-48423] =3D "cpe-stable-backport: Backported in 6.1.3=
"
-
-CVE_STATUS[CVE-2022-48424] =3D "cpe-stable-backport: Backported in 6.1.3=
"
-
-CVE_STATUS[CVE-2022-48425] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-CVE_STATUS[CVE-2022-48502] =3D "cpe-stable-backport: Backported in 6.1.4=
0"
-
-CVE_STATUS[CVE-2022-48619] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2023-0030] =3D "fixed-version: Fixed from version 5.0rc1"
-
-CVE_STATUS[CVE-2023-0045] =3D "cpe-stable-backport: Backported in 6.1.5"
-
-CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed from version 5.16rc1=
"
-
-CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed from version 6.0rc4"
-
-CVE_STATUS[CVE-2023-0160] =3D "cpe-stable-backport: Backported in 6.1.28=
"
-
-CVE_STATUS[CVE-2023-0179] =3D "cpe-stable-backport: Backported in 6.1.7"
-
-CVE_STATUS[CVE-2023-0210] =3D "cpe-stable-backport: Backported in 6.1.5"
-
-CVE_STATUS[CVE-2023-0240] =3D "fixed-version: Fixed from version 5.10rc1=
"
-
-CVE_STATUS[CVE-2023-0266] =3D "cpe-stable-backport: Backported in 6.1.6"
-
-CVE_STATUS[CVE-2023-0386] =3D "cpe-stable-backport: Backported in 6.1.9"
-
-CVE_STATUS[CVE-2023-0394] =3D "cpe-stable-backport: Backported in 6.1.7"
-
-CVE_STATUS[CVE-2023-0458] =3D "cpe-stable-backport: Backported in 6.1.8"
-
-CVE_STATUS[CVE-2023-0459] =3D "cpe-stable-backport: Backported in 6.1.14=
"
-
-CVE_STATUS[CVE-2023-0461] =3D "cpe-stable-backport: Backported in 6.1.5"
-
-CVE_STATUS[CVE-2023-0468] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2023-0469] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2023-0590] =3D "fixed-version: Fixed from version 6.1rc2"
-
-# CVE-2023-0597 needs backporting (fixed from 6.2rc1)
-
-CVE_STATUS[CVE-2023-0615] =3D "fixed-version: Fixed from version 6.1rc3"
-
-CVE_STATUS[CVE-2023-1032] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-1073] =3D "cpe-stable-backport: Backported in 6.1.9"
-
-CVE_STATUS[CVE-2023-1074] =3D "cpe-stable-backport: Backported in 6.1.9"
-
-CVE_STATUS[CVE-2023-1075] =3D "cpe-stable-backport: Backported in 6.1.11=
"
-
-CVE_STATUS[CVE-2023-1076] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-1077] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-1078] =3D "cpe-stable-backport: Backported in 6.1.12=
"
-
-CVE_STATUS[CVE-2023-1079] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-1095] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2023-1118] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-1192] =3D "cpe-stable-backport: Backported in 6.1.33=
"
-
-CVE_STATUS[CVE-2023-1193] =3D "cpe-stable-backport: Backported in 6.1.71=
"
-
-CVE_STATUS[CVE-2023-1194] =3D "cpe-stable-backport: Backported in 6.1.34=
"
-
-CVE_STATUS[CVE-2023-1195] =3D "fixed-version: Fixed from version 6.1rc3"
-
-CVE_STATUS[CVE-2023-1206] =3D "cpe-stable-backport: Backported in 6.1.43=
"
-
-CVE_STATUS[CVE-2023-1249] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2023-1252] =3D "fixed-version: Fixed from version 5.16rc1=
"
-
-CVE_STATUS[CVE-2023-1281] =3D "cpe-stable-backport: Backported in 6.1.13=
"
-
-CVE_STATUS[CVE-2023-1295] =3D "fixed-version: Fixed from version 5.12rc1=
"
-
-CVE_STATUS[CVE-2023-1380] =3D "cpe-stable-backport: Backported in 6.1.27=
"
-
-CVE_STATUS[CVE-2023-1382] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2023-1390] =3D "fixed-version: Fixed from version 5.11rc4=
"
-
-# CVE-2023-1476 has no known resolution
-
-CVE_STATUS[CVE-2023-1513] =3D "cpe-stable-backport: Backported in 6.1.13=
"
-
-CVE_STATUS[CVE-2023-1582] =3D "fixed-version: Fixed from version 5.17rc4=
"
-
-CVE_STATUS[CVE-2023-1583] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2023-1611] =3D "cpe-stable-backport: Backported in 6.1.23=
"
-
-CVE_STATUS[CVE-2023-1637] =3D "fixed-version: Fixed from version 5.18rc2=
"
-
-CVE_STATUS[CVE-2023-1652] =3D "cpe-stable-backport: Backported in 6.1.9"
-
-CVE_STATUS[CVE-2023-1670] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2023-1829] =3D "cpe-stable-backport: Backported in 6.1.18=
"
-
-CVE_STATUS[CVE-2023-1838] =3D "fixed-version: Fixed from version 5.18"
-
-CVE_STATUS[CVE-2023-1855] =3D "cpe-stable-backport: Backported in 6.1.21=
"
-
-CVE_STATUS[CVE-2023-1859] =3D "cpe-stable-backport: Backported in 6.1.25=
"
-
-CVE_STATUS[CVE-2023-1872] =3D "fixed-version: Fixed from version 5.18rc2=
"
-
-CVE_STATUS[CVE-2023-1989] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2023-1990] =3D "cpe-stable-backport: Backported in 6.1.21=
"
-
-CVE_STATUS[CVE-2023-1998] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-2002] =3D "cpe-stable-backport: Backported in 6.1.27=
"
-
-CVE_STATUS[CVE-2023-2006] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2023-2007] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed from version 5.19rc4=
"
-
-CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2023-20569] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
-
-CVE_STATUS[CVE-2023-20588] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
-
-CVE_STATUS[CVE-2023-20593] =3D "cpe-stable-backport: Backported in 6.1.4=
1"
-
-CVE_STATUS[CVE-2023-20928] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-# CVE-2023-20937 has no known resolution
-
-CVE_STATUS[CVE-2023-20938] =3D "fixed-version: Fixed from version 5.18rc=
5"
-
-# CVE-2023-20941 has no known resolution
-
-CVE_STATUS[CVE-2023-21102] =3D "cpe-stable-backport: Backported in 6.1.8=
"
-
-CVE_STATUS[CVE-2023-21106] =3D "cpe-stable-backport: Backported in 6.1.9=
"
-
-CVE_STATUS[CVE-2023-2124] =3D "cpe-stable-backport: Backported in 6.1.33=
"
-
-CVE_STATUS[CVE-2023-21255] =3D "cpe-stable-backport: Backported in 6.1.3=
1"
-
-# CVE-2023-21264 needs backporting (fixed from 6.4rc5)
-
-# CVE-2023-21400 has no known resolution
-
-CVE_STATUS[CVE-2023-2156] =3D "cpe-stable-backport: Backported in 6.1.26=
"
-
-CVE_STATUS[CVE-2023-2162] =3D "cpe-stable-backport: Backported in 6.1.11=
"
-
-CVE_STATUS[CVE-2023-2163] =3D "cpe-stable-backport: Backported in 6.1.26=
"
-
-CVE_STATUS[CVE-2023-2166] =3D "fixed-version: Fixed from version 6.1"
-
-# CVE-2023-2176 needs backporting (fixed from 6.3rc1)
-
-CVE_STATUS[CVE-2023-2177] =3D "fixed-version: Fixed from version 5.19"
-
-CVE_STATUS[CVE-2023-2194] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2023-2235] =3D "cpe-stable-backport: Backported in 6.1.21=
"
-
-CVE_STATUS[CVE-2023-2236] =3D "fixed-version: Fixed from version 6.1rc7"
-
-CVE_STATUS[CVE-2023-2248] =3D "cpe-stable-backport: Backported in 6.1.26=
"
-
-CVE_STATUS[CVE-2023-2269] =3D "cpe-stable-backport: Backported in 6.1.28=
"
-
-CVE_STATUS[CVE-2023-22995] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2023-22996] =3D "fixed-version: Fixed from version 5.18rc=
1"
-
-CVE_STATUS[CVE-2023-22997] =3D "cpe-stable-backport: Backported in 6.1.2=
"
-
-CVE_STATUS[CVE-2023-22998] =3D "fixed-version: Fixed from version 6.0rc1=
"
-
-CVE_STATUS[CVE-2023-22999] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2023-23000] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2023-23001] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2023-23002] =3D "fixed-version: Fixed from version 5.17rc=
1"
-
-CVE_STATUS[CVE-2023-23003] =3D "fixed-version: Fixed from version 5.16rc=
6"
-
-CVE_STATUS[CVE-2023-23004] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-# CVE-2023-23005 needs backporting (fixed from 6.2rc1)
-
-CVE_STATUS[CVE-2023-23006] =3D "fixed-version: Fixed from version 5.16rc=
8"
-
-# CVE-2023-23039 has no known resolution
-
-CVE_STATUS[CVE-2023-23454] =3D "cpe-stable-backport: Backported in 6.1.5=
"
-
-CVE_STATUS[CVE-2023-23455] =3D "cpe-stable-backport: Backported in 6.1.5=
"
-
-CVE_STATUS[CVE-2023-23559] =3D "cpe-stable-backport: Backported in 6.1.9=
"
-
-CVE_STATUS[CVE-2023-23586] =3D "fixed-version: Fixed from version 5.12rc=
1"
-
-CVE_STATUS[CVE-2023-2430] =3D "cpe-stable-backport: Backported in 6.1.50=
"
-
-CVE_STATUS[CVE-2023-2483] =3D "cpe-stable-backport: Backported in 6.1.22=
"
-
-CVE_STATUS[CVE-2023-25012] =3D "cpe-stable-backport: Backported in 6.1.1=
6"
-
-CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2023-25775] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-2598] =3D "fixed-version: only affects 6.3rc1 onward=
s"
-
-# CVE-2023-26242 has no known resolution
-
-# CVE-2023-2640 has no known resolution
-
-CVE_STATUS[CVE-2023-26544] =3D "cpe-stable-backport: Backported in 6.1.3=
"
-
-CVE_STATUS[CVE-2023-26545] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
-
-CVE_STATUS[CVE-2023-26605] =3D "fixed-version: Fixed from version 6.1rc7=
"
-
-CVE_STATUS[CVE-2023-26606] =3D "cpe-stable-backport: Backported in 6.1.2=
"
-
-CVE_STATUS[CVE-2023-26607] =3D "fixed-version: Fixed from version 6.1rc1=
"
-
-CVE_STATUS[CVE-2023-28327] =3D "fixed-version: Fixed from version 6.1"
-
-CVE_STATUS[CVE-2023-28328] =3D "cpe-stable-backport: Backported in 6.1.2=
"
-
-CVE_STATUS[CVE-2023-28410] =3D "fixed-version: Fixed from version 5.19rc=
1"
-
-CVE_STATUS[CVE-2023-28464] =3D "fixed-version: only affects 6.3rc1 onwar=
ds"
-
-CVE_STATUS[CVE-2023-28466] =3D "cpe-stable-backport: Backported in 6.1.2=
0"
-
-CVE_STATUS[CVE-2023-2860] =3D "fixed-version: Fixed from version 6.0rc5"
-
-CVE_STATUS[CVE-2023-28772] =3D "fixed-version: Fixed from version 5.14rc=
1"
-
-CVE_STATUS[CVE-2023-28866] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
-
-CVE_STATUS[CVE-2023-2898] =3D "cpe-stable-backport: Backported in 6.1.39=
"
-
-CVE_STATUS[CVE-2023-2985] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-3006] =3D "fixed-version: Fixed from version 6.1rc1"
-
-# Skipping CVE-2023-3022, no affected_versions
-
-CVE_STATUS[CVE-2023-30456] =3D "cpe-stable-backport: Backported in 6.1.2=
1"
-
-CVE_STATUS[CVE-2023-30772] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
-
-CVE_STATUS[CVE-2023-3090] =3D "cpe-stable-backport: Backported in 6.1.30=
"
-
-CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed from version 4.8rc7"
-
-# Skipping CVE-2023-3108, no affected_versions
-
-# CVE-2023-31081 has no known resolution
-
-# CVE-2023-31082 has no known resolution
-
-# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
-
-# CVE-2023-31084 needs backporting (fixed from 6.4rc3)
-
-CVE_STATUS[CVE-2023-31085] =3D "cpe-stable-backport: Backported in 6.1.5=
7"
-
-CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed from version 6.0rc2"
-
-CVE_STATUS[CVE-2023-3117] =3D "cpe-stable-backport: Backported in 6.1.35=
"
-
-CVE_STATUS[CVE-2023-31248] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
-
-CVE_STATUS[CVE-2023-3141] =3D "cpe-stable-backport: Backported in 6.1.30=
"
-
-CVE_STATUS[CVE-2023-31436] =3D "cpe-stable-backport: Backported in 6.1.2=
6"
-
-CVE_STATUS[CVE-2023-3159] =3D "fixed-version: Fixed from version 5.18rc6=
"
-
-CVE_STATUS[CVE-2023-3161] =3D "cpe-stable-backport: Backported in 6.1.11=
"
-
-CVE_STATUS[CVE-2023-3212] =3D "cpe-stable-backport: Backported in 6.1.33=
"
-
-CVE_STATUS[CVE-2023-3220] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-32233] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-32247] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-32248] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-32250] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-32252] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-32254] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-32257] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-32258] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-32269] =3D "cpe-stable-backport: Backported in 6.1.1=
1"
-
-# CVE-2023-32629 has no known resolution
-
-CVE_STATUS[CVE-2023-3268] =3D "cpe-stable-backport: Backported in 6.1.28=
"
-
-CVE_STATUS[CVE-2023-3269] =3D "cpe-stable-backport: Backported in 6.1.37=
"
-
-CVE_STATUS[CVE-2023-3312] =3D "fixed-version: only affects 6.2rc1 onward=
s"
-
-CVE_STATUS[CVE-2023-3317] =3D "fixed-version: only affects 6.2rc1 onward=
s"
-
-CVE_STATUS[CVE-2023-33203] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
-
-CVE_STATUS[CVE-2023-33250] =3D "fixed-version: only affects 6.2rc1 onwar=
ds"
-
-CVE_STATUS[CVE-2023-33288] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
-
-CVE_STATUS[CVE-2023-3338] =3D "fixed-version: Fixed from version 6.1rc1"
-
-CVE_STATUS[CVE-2023-3355] =3D "cpe-stable-backport: Backported in 6.1.16=
"
-
-CVE_STATUS[CVE-2023-3357] =3D "cpe-stable-backport: Backported in 6.1.2"
-
-CVE_STATUS[CVE-2023-3358] =3D "cpe-stable-backport: Backported in 6.1.9"
-
-CVE_STATUS[CVE-2023-3359] =3D "cpe-stable-backport: Backported in 6.1.11=
"
-
-CVE_STATUS[CVE-2023-3389] =3D "fixed-version: Fixed from version 6.0rc1"
-
-CVE_STATUS[CVE-2023-3390] =3D "cpe-stable-backport: Backported in 6.1.35=
"
-
-CVE_STATUS[CVE-2023-33951] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
-
-CVE_STATUS[CVE-2023-33952] =3D "cpe-stable-backport: Backported in 6.1.1=
3"
-
-# CVE-2023-3397 has no known resolution
-
-CVE_STATUS[CVE-2023-34255] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
-
-CVE_STATUS[CVE-2023-34319] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
-
-CVE_STATUS[CVE-2023-34324] =3D "cpe-stable-backport: Backported in 6.1.5=
7"
-
-CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed from version 5.18rc5=
"
-
-CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
-
-CVE_STATUS[CVE-2023-3567] =3D "cpe-stable-backport: Backported in 6.1.11=
"
-
-# CVE-2023-35693 has no known resolution
-
-CVE_STATUS[CVE-2023-35788] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
-
-CVE_STATUS[CVE-2023-35823] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-35824] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-35826] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-35827] =3D "cpe-stable-backport: Backported in 6.1.5=
9"
-
-CVE_STATUS[CVE-2023-35828] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-35829] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
-
-CVE_STATUS[CVE-2023-3609] =3D "cpe-stable-backport: Backported in 6.1.35=
"
-
-CVE_STATUS[CVE-2023-3610] =3D "cpe-stable-backport: Backported in 6.1.36=
"
-
-CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport: Backported in 6.1.40=
"
-
-# CVE-2023-3640 has no known resolution
-
-CVE_STATUS[CVE-2023-37453] =3D "fixed-version: only affects 6.3rc1 onwar=
ds"
-
-# CVE-2023-37454 has no known resolution
-
-CVE_STATUS[CVE-2023-3772] =3D "cpe-stable-backport: Backported in 6.1.47=
"
-
-CVE_STATUS[CVE-2023-3773] =3D "cpe-stable-backport: Backported in 6.1.47=
"
-
-CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.1.40=
"
-
-CVE_STATUS[CVE-2023-3777] =3D "cpe-stable-backport: Backported in 6.1.42=
"
-
-CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed from version 6.1rc4"
-
-CVE_STATUS[CVE-2023-38409] =3D "cpe-stable-backport: Backported in 6.1.2=
5"
-
-CVE_STATUS[CVE-2023-38426] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
-
-CVE_STATUS[CVE-2023-38427] =3D "cpe-stable-backport: Backported in 6.1.3=
4"
-
-CVE_STATUS[CVE-2023-38428] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
-
-CVE_STATUS[CVE-2023-38429] =3D "cpe-stable-backport: Backported in 6.1.3=
0"
-
-CVE_STATUS[CVE-2023-38430] =3D "cpe-stable-backport: Backported in 6.1.3=
5"
-
-CVE_STATUS[CVE-2023-38431] =3D "cpe-stable-backport: Backported in 6.1.3=
4"
-
-CVE_STATUS[CVE-2023-38432] =3D "cpe-stable-backport: Backported in 6.1.3=
6"
-
-CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.1.39=
"
-
-CVE_STATUS[CVE-2023-3865] =3D "cpe-stable-backport: Backported in 6.1.36=
"
-
-CVE_STATUS[CVE-2023-3866] =3D "cpe-stable-backport: Backported in 6.1.36=
"
-
-CVE_STATUS[CVE-2023-3867] =3D "cpe-stable-backport: Backported in 6.1.40=
"
-
-CVE_STATUS[CVE-2023-39189] =3D "cpe-stable-backport: Backported in 6.1.5=
4"
-
-# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
-
-CVE_STATUS[CVE-2023-39192] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-39193] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-39194] =3D "cpe-stable-backport: Backported in 6.1.4=
7"
-
-CVE_STATUS[CVE-2023-39197] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
-
-CVE_STATUS[CVE-2023-39198] =3D "cpe-stable-backport: Backported in 6.1.4=
7"
-
-CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.1.42=
"
-
-# CVE-2023-4010 has no known resolution
-
-CVE_STATUS[CVE-2023-4015] =3D "cpe-stable-backport: Backported in 6.1.43=
"
-
-CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
-
-CVE_STATUS[CVE-2023-40791] =3D "fixed-version: only affects 6.3rc1 onwar=
ds"
-
-CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.1.45=
"
-
-CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.1.39=
"
-
-# CVE-2023-4133 needs backporting (fixed from 6.3)
-
-# CVE-2023-4134 needs backporting (fixed from 6.5rc1)
-
-CVE_STATUS[CVE-2023-4147] =3D "cpe-stable-backport: Backported in 6.1.43=
"
-
-CVE_STATUS[CVE-2023-4155] =3D "cpe-stable-backport: Backported in 6.1.46=
"
-
-CVE_STATUS[CVE-2023-4194] =3D "fixed-version: only affects 6.3rc1 onward=
s"
-
-CVE_STATUS[CVE-2023-4206] =3D "cpe-stable-backport: Backported in 6.1.45=
"
-
-CVE_STATUS[CVE-2023-4207] =3D "cpe-stable-backport: Backported in 6.1.45=
"
-
-CVE_STATUS[CVE-2023-4208] =3D "cpe-stable-backport: Backported in 6.1.45=
"
-
-CVE_STATUS[CVE-2023-4244] =3D "cpe-stable-backport: Backported in 6.1.56=
"
-
-CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.1.45=
"
-
-CVE_STATUS[CVE-2023-42752] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-42753] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-42754] =3D "cpe-stable-backport: Backported in 6.1.5=
6"
-
-CVE_STATUS[CVE-2023-42755] =3D "cpe-stable-backport: Backported in 6.1.5=
5"
-
-CVE_STATUS[CVE-2023-42756] =3D "fixed-version: only affects 6.4rc6 onwar=
ds"
-
-CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1=
"
-
-CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed from version 5.18"
-
-CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fixed from version 5.18rc3=
"
-
-CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed from version 6.0rc3"
-
-CVE_STATUS[CVE-2023-44466] =3D "cpe-stable-backport: Backported in 6.1.4=
0"
-
-CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
-
-CVE_STATUS[CVE-2023-4563] =3D "cpe-stable-backport: Backported in 6.1.56=
"
-
-CVE_STATUS[CVE-2023-4569] =3D "cpe-stable-backport: Backported in 6.1.47=
"
-
-CVE_STATUS[CVE-2023-45862] =3D "cpe-stable-backport: Backported in 6.1.1=
8"
-
-CVE_STATUS[CVE-2023-45863] =3D "cpe-stable-backport: Backported in 6.1.1=
6"
-
-CVE_STATUS[CVE-2023-45871] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
-
-CVE_STATUS[CVE-2023-45898] =3D "fixed-version: only affects 6.5rc1 onwar=
ds"
-
-CVE_STATUS[CVE-2023-4610] =3D "fixed-version: only affects 6.4rc1 onward=
s"
-
-CVE_STATUS[CVE-2023-4611] =3D "fixed-version: only affects 6.4rc1 onward=
s"
-
-# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
-
-CVE_STATUS[CVE-2023-4623] =3D "cpe-stable-backport: Backported in 6.1.53=
"
-
-CVE_STATUS[CVE-2023-46813] =3D "cpe-stable-backport: Backported in 6.1.6=
0"
-
-CVE_STATUS[CVE-2023-46862] =3D "cpe-stable-backport: Backported in 6.1.6=
1"
-
-# CVE-2023-47233 has no known resolution
-
-CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1=
"
-
-CVE_STATUS[CVE-2023-4881] =3D "cpe-stable-backport: Backported in 6.1.54=
"
-
-CVE_STATUS[CVE-2023-4921] =3D "cpe-stable-backport: Backported in 6.1.54=
"
-
-# CVE-2023-50431 has no known resolution
-
-CVE_STATUS[CVE-2023-5090] =3D "cpe-stable-backport: Backported in 6.1.62=
"
-
-CVE_STATUS[CVE-2023-5158] =3D "cpe-stable-backport: Backported in 6.1.57=
"
-
-CVE_STATUS[CVE-2023-51779] =3D "cpe-stable-backport: Backported in 6.1.7=
0"
-
-CVE_STATUS[CVE-2023-5178] =3D "cpe-stable-backport: Backported in 6.1.60=
"
-
-CVE_STATUS[CVE-2023-51780] =3D "cpe-stable-backport: Backported in 6.1.6=
9"
-
-CVE_STATUS[CVE-2023-51781] =3D "cpe-stable-backport: Backported in 6.1.6=
9"
-
-CVE_STATUS[CVE-2023-51782] =3D "cpe-stable-backport: Backported in 6.1.6=
9"
-
-CVE_STATUS[CVE-2023-5197] =3D "cpe-stable-backport: Backported in 6.1.56=
"
-
-CVE_STATUS[CVE-2023-5345] =3D "cpe-stable-backport: Backported in 6.1.56=
"
-
-CVE_STATUS[CVE-2023-5633] =3D "fixed-version: only affects 6.2 onwards"
-
-CVE_STATUS[CVE-2023-5717] =3D "cpe-stable-backport: Backported in 6.1.60=
"
-
-CVE_STATUS[CVE-2023-5972] =3D "fixed-version: only affects 6.2rc1 onward=
s"
-
-# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
-
-CVE_STATUS[CVE-2023-6040] =3D "fixed-version: Fixed from version 5.18rc1=
"
-
-CVE_STATUS[CVE-2023-6111] =3D "fixed-version: only affects 6.6rc3 onward=
s"
-
-CVE_STATUS[CVE-2023-6121] =3D "cpe-stable-backport: Backported in 6.1.65=
"
-
-CVE_STATUS[CVE-2023-6176] =3D "cpe-stable-backport: Backported in 6.1.54=
"
-
-# CVE-2023-6238 has no known resolution
-
-# CVE-2023-6270 has no known resolution
-
-# CVE-2023-6356 has no known resolution
-
-CVE_STATUS[CVE-2023-6531] =3D "cpe-stable-backport: Backported in 6.1.68=
"
-
-# CVE-2023-6535 has no known resolution
-
-# CVE-2023-6536 has no known resolution
-
-CVE_STATUS[CVE-2023-6546] =3D "cpe-stable-backport: Backported in 6.1.47=
"
-
-# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
-
-CVE_STATUS[CVE-2023-6606] =3D "cpe-stable-backport: Backported in 6.1.70=
"
-
-# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
-
-CVE_STATUS[CVE-2023-6622] =3D "cpe-stable-backport: Backported in 6.1.68=
"
-
-CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onward=
s"
-
-CVE_STATUS[CVE-2023-6817] =3D "cpe-stable-backport: Backported in 6.1.68=
"
-
-CVE_STATUS[CVE-2023-6931] =3D "cpe-stable-backport: Backported in 6.1.68=
"
-
-CVE_STATUS[CVE-2023-6932] =3D "cpe-stable-backport: Backported in 6.1.66=
"
-
-# CVE-2023-7042 has no known resolution
-
-CVE_STATUS[CVE-2023-7192] =3D "cpe-stable-backport: Backported in 6.1.18=
"
-
-CVE_STATUS[CVE-2024-0193] =3D "fixed-version: only affects 6.5rc6 onward=
s"
-
-# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
-
-CVE_STATUS[CVE-2024-0443] =3D "fixed-version: only affects 6.2rc1 onward=
s"
-
-# Skipping dd=3DCVE-2023-1476, no affected_versions
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-perf-cpumap-Mak=
e-counter-as-unsigned-ints.patch b/meta-arm-bsp/recipes-kernel/linux/file=
s/0001-perf-cpumap-Make-counter-as-unsigned-ints.patch
deleted file mode 100644
index 2bfc40fe..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/0001-perf-cpumap-Make-count=
er-as-unsigned-ints.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From d14450f9e0f05ea7177c5404a7a9289352caab77 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 13:04:10 -0800
-Subject: [PATCH] perf cpumap: Make counter as unsigned ints
-
-These are loop counters which is inherently unsigned. Therefore make
-them unsigned. Moreover it also fixes alloc-size-larger-than
-error with gcc-13, where malloc can be called with (-1) due to tmp_len
-being an int type.
-
-Fixes
-| cpumap.c:366:20: error: argument 1 range [18446744065119617024, 184467=
44073709551612] exceeds maximum object size 9223372036854775807 [-Werror=3D=
alloc-size-larger-than=3D]
-|   366 |         tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu))=
;
-|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Ingo Molnar <mingo@redhat.com>
-Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@kernel.org>
-Cc: Namhyung Kim <namhyung@kernel.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-perf-users/202=
30123211310.127532-1-raj.khem@gmail.com/T/#u]
----
- tools/lib/perf/cpumap.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
-index 6cd0be7c1bb4..d960880dd903 100644
---- a/tools/lib/perf/cpumap.c
-+++ b/tools/lib/perf/cpumap.c
-@@ -351,8 +351,8 @@ struct perf_cpu_map *perf_cpu_map__merge(struct perf=
_cpu_map *orig,
- 					 struct perf_cpu_map *other)
- {
- 	struct perf_cpu *tmp_cpus;
--	int tmp_len;
--	int i, j, k;
-+	unsigned int tmp_len;
-+	unsigned int i, j, k;
- 	struct perf_cpu_map *merged;
-=20
- 	if (perf_cpu_map__is_subset(orig, other))
-@@ -369,7 +369,7 @@ struct perf_cpu_map *perf_cpu_map__merge(struct perf=
_cpu_map *orig,
-=20
- 	/* Standard merge algorithm from wikipedia */
- 	i =3D j =3D k =3D 0;
--	while (i < orig->nr && j < other->nr) {
-+	while (i < (unsigned int)orig->nr && j < (unsigned int)other->nr) {
- 		if (orig->map[i].cpu <=3D other->map[j].cpu) {
- 			if (orig->map[i].cpu =3D=3D other->map[j].cpu)
- 				j++;
-@@ -378,10 +378,10 @@ struct perf_cpu_map *perf_cpu_map__merge(struct pe=
rf_cpu_map *orig,
- 			tmp_cpus[k++] =3D other->map[j++];
- 	}
-=20
--	while (i < orig->nr)
-+	while (i < (unsigned int)orig->nr)
- 		tmp_cpus[k++] =3D orig->map[i++];
-=20
--	while (j < other->nr)
-+	while (j < (unsigned int)other->nr)
- 		tmp_cpus[k++] =3D other->map[j++];
- 	assert(k <=3D tmp_len);
-=20
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappe=
nd b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
deleted file mode 100644
index 94d3398c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/me=
ta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1.bb
deleted file mode 100644
index 5caf99de..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?=3D "v6.1/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion_6.1.inc
-
-# Skip processing of this recipe if it is not explicitly specified as th=
e
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-# to build multiple virtual/kernel providers, e.g. as dependency of
-# core-image-rt-sdk, core-image-rt.
-python () {
-    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and d.getVar("PRE=
FERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
-        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?=3D "c7164e4299dfbd93c9ec4f9bd307ebbb88aa6b71"
-SRCREV_meta ?=3D "4fe5dc52631f3b990aefbb3f97330137c4ebb288"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps"
-
-LINUX_VERSION ?=3D "6.1.70"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-
-DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
-DEPENDS +=3D "openssl-native util-linux-native"
-
-PV =3D "${LINUX_VERSION}+git"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-LINUX_KERNEL_TYPE =3D "preempt-rt"
-
-COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64=
|qemuppc|qemumips)$"
-
-KERNEL_DEVICETREE:qemuarmv5 =3D "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc features/ta=
skstats/taskstats.scc"
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1%.bbappend
deleted file mode 100644
index 94d3398c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-    file://0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patch \
-    "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_6.1.bb
deleted file mode 100644
index 5191af6a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-KBRANCH ?=3D "v6.1/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion.inc
-include recipes-kernel/linux/cve-exclusion_6.1.inc
-
-SRCREV_machine ?=3D "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
-SRCREV_meta ?=3D "40dede8a165ea5894f172fede6baa0dd94d23fec"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the=
 same
-# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND =3D "devupstream:target"
-SRCREV_machine:class-devupstream ?=3D "fec3b1451d5febbc9e04250f879c10f89=
52e6bed"
-PN:class-devupstream =3D "linux-yocto-upstream"
-KBRANCH:class-devupstream =3D "v6.1/base"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps"
-SRC_URI +=3D "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patc=
h"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION ?=3D "6.1.73"
-
-PV =3D "${LINUX_VERSION}+git"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
--=20
2.40.0.windows.1


