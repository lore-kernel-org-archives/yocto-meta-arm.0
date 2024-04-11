Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A9ECD129A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17057.1712840388846356862
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D79FF11FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F9373F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:48 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-a: update to 2.10.3 release
Date: Thu, 11 Apr 2024 08:59:45 -0400
Message-Id: <20240411125947.64959-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240411125947.64959-1-jon.mason@arm.com>
References: <20240411125947.64959-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5524

Update to the latest stable version (2.10.3), comprised of the following
commits:
	fc93d0edfc52 docs(changelog): changelog for lts-v2.10.3 release
	4a10950a8538 docs(changelog): display all sections
	bafc27c8d7cf chore: rename Poseidon to Neoverse V3
	a6256d7a2638 feat(cpu): add support for Poseidon V CPU
	ef393a3f9fa2 fix(cpu): correct variant name for default Poseidon CPU
	81931a13a835 fix(cpus): workaround for Cortex-A715 erratum 2413290
	baf14745f117 fix(cpus): workaround for Cortex-A720 erratum 2926083
	635c83eb456a chore: update status of Cortex-X3 erratum 2615812
	03636f2c3d60 fix(cpus): workaround for Cortex-A720 erratum 2940794
	e86990d0911d fix(cpus): fix a defect in Cortex-A715 erratum 2561034
	b59307ef8efd fix(cpus): workaround for Cortex-A715 erratum 2413290
	44f36c48f280 docs(sdei): provide security guidelines when using SDEI
	11cb0962f7ac docs(threat_model): mark power analysis threats out-of-scop=
e
	3e3ff298a614 fix(cpus): workaround for Cortex-A715 erratum 2344187
	d466c5d4d27b fix(cpus): workaround for Cortex-X4 erratum 2701112
	940ebbe2d1d0 fix(cpus): workaround for Cortex-A715 erratum 2331818
	04c60d5ef31c fix(cpus): workaround for Cortex-A715 erratum 2420947
	b7ed781eea74 fix(gic600): workaround for Part 1 of GIC600 erratum 238437=
4
	58646309aedf chore: rearrange the fvp_cpu_errata.mk file
	a234f540b727 fix(cpus): add erratum 2701951 to Cortex-X3's list
	a24c8006ea39 refactor(errata-abi): workaround platforms non-arm intercon=
nect
	9fe65073d442 refactor(errata-abi): optimize errata ABI using errata fram=
ework
	301698e15bc8 fix(cpus): workaround for Cortex-A715 erratum 2429384
	5f8f745c7e99 fix(cpus): workaround for Cortex-X3 erratum 2372204

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.10.2.bb =3D> fiptool-native_2.10.3.bb}    | 4 ++--
 ...sted-firmware-a_2.10.2.bb =3D> trusted-firmware-a_2.10.3.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.2.bb=
 =3D> fiptool-native_2.10.3.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
2.bb =3D> trusted-firmware-a_2.10.3.bb} (86%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.3.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.2=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.3.b=
b
index d0c057a1e8c1..5ba8d48cb499 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.3.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.2
-SRCREV =3D "a1be69e6c5db450f841f0edd9d734bf3cffb6621"
+# Use fiptool from TF-A v2.10.3
+SRCREV =3D "0f915309c3821ce6f78f8451e5a6178d0cf07611"
 SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.3.bb
similarity index 86%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.2.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.3.bb
index bf2a8c168c3d..b30ac7252d77 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.b=
b
@@ -1,7 +1,7 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.2
-SRCREV_tfa =3D "a1be69e6c5db450f841f0edd9d734bf3cffb6621"
+# TF-A v2.10.3
+SRCREV_tfa =3D "0f915309c3821ce6f78f8451e5a6178d0cf07611"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
--=20
2.39.3 (Apple Git-146)


