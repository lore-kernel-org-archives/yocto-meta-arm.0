Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A622EC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10422.1742483642051597641
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 08:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 812C520E3
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:14:09 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CD793F673
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:14:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/trusted-firmware-a: update 2.12.0 recipe to 2.12.1
Date: Thu, 20 Mar 2025 11:14:00 -0400
Message-Id: <20250320151400.19610-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250320151400.19610-1-jon.mason@arm.com>
References: <20250320151400.19610-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 15:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6408

Update to the lts-v2.12.1 tag.  Changes include a number of CVE fixes
and mbedtls minor version bump:
	8cf9edba5cc3 docs(changelog): changelog for lts-v2.12.1 release
	f5d048108bf3 Merge changes from topic "for-lts-v2.12.1" into lts-v2.12
	56472775f96d docs(maintainers): update LTS maintainers
	baab55315c7f docs: updates to LTS
	f00f71efc410 docs: add inital lts doc
	1a8ee82c6d77 Merge changes from topic "for-lts-v2.12.1" into lts-v2.12
	b19ce90a908c fix(rd1ae): fix rd1-ae device tree
	34f10e7d9fc7 feat(rd1ae): add Generic Timer in device tree
	551dc4c09f57 docs(rd1ae): update documentation to include BL32
	8e4240779867 feat(rd1ae): add support for OP-TEE SPMC
	8e4bb69c747e feat(mbedtls): mbedtls config update for v3.6.2
	a46d6a1320d7 docs(prerequisites): update mbedtls to version 3.6.2
	2ffe181a3982 refactor(mbedtls): rename default mbedtls confs
	3809359e2124 fix(cpus): workaround for Neoverse-V3 erratum 3701767
	4a9ff092c9b4 fix(cpus): workaround for Neoverse-N3 erratum 3699563
	7e41b706e97c fix(cpus): workaround for Neoverse-N2 erratum 3701773
	15300ac30c55 fix(cpus): workaround for Cortex-X925 erratum 3701747
	6e0efc7fe739 fix(cpus): workaround for Cortex-X4 erratum 3701758
	8299c1274617 fix(cpus): workaround for Cortex-X3 erratum 3701769
	fa6c9874485b fix(cpus): workaround for Cortex-X2 erratum 3701772
	4e78288fd2bc fix(cpus): workaround for Cortex-A725 erratum 3699564
	ae6edfd5b543 fix(cpus): workaround for Cortex-A720-AE erratum 3699562
	24526273fc50 fix(cpus): workaround for Cortex-A720 erratum 3699561
	a7b322706435 fix(cpus): workaround for Cortex-A715 erratum 3699560
	d4826882210b fix(cpus): workaround for Cortex-A710 erratum 3701772
	9d6143ec8ffb fix(cpus): workaround for accessing ICH_VMCR_EL2
	7e4bf042a0dd chore(cpus): fix incorrect header macro
	9427c061eb8d fix(security): apply SMCCC_ARCH_WORKAROUND_4 to affected cp=
us
	bea64fd5272d fix(security): add support in cpu_ops for CVE-2024-7881
	16b87247ed03 fix(security): add CVE-2024-7881 mitigation to Cortex-X3
	427c33bc0c0b fix(security): add CVE-2024-7881 mitigation to Neoverse-V3
	192a152448ae fix(security): add CVE-2024-7881 mitigation to Neoverse-V2
	3e4d94c43b64 fix(security): add CVE-2024-7881 mitigation to Cortex-X925
	41a52efd6f38 fix(security): add CVE-2024-7881 mitigation to Cortex-X4
	2f09b9f3c2af fix(security): enable WORKAROUND_CVE_2024_7881 build option
	70a7d3f2d030 fix(cpus): workaround for CVE-2024-5660 for Cortex-X925
	41b64fe36f42 fix(cpus): workaround for CVE-2024-5660 for Cortex-X2
	0b2d22097c96 fix(cpus): workaround for CVE-2024-5660 for Cortex-A77
	193370e1c6a2 fix(cpus): workaround for CVE-2024-5660 for Neoverse-V1
	d52c52a5fa8c fix(cpus): workaround for CVE-2024-5660 for Cortex-A78_AE
	3bd6531a55a4 fix(cpus): workaround for CVE-2024-5660 for Cortex-A78C
	eda09acd1b22 fix(cpus): workaround for CVE-2024-5660 for Cortex-A78
	b9766da96365 fix(cpus): workaround for CVE-2024-5660 for Cortex-X1
	6324220805b1 fix(cpus): workaround for CVE-2024-5660 for Neoverse-N2
	6041f0723994 fix(cpus): workaround for CVE-2024-5660 for Cortex-A710
	b23f5da614e6 fix(cpus): workaround for CVE-2024-5660 for Neoverse-V2
	ef378713fa4b fix(cpus): workaround for CVE-2024-5660 for Cortex-X3
	2898088f8ba6 fix(cpus): workaround for CVE-2024-5660 for Neoverse-V3
	b8e111c72619 fix(cpus): workaround for CVE-2024-5660 for Cortex-X4
	a6f6396313ea fix(cpus): workaround for Cortex-X4 erratum 2923985
	d1c3a5d8b9d8 fix(build): do not force PLAT in plat_helpers.mk
	ea1b816b1763 chore(deps): update pytest for cot-dt2c
	65762d7b4cfc chore(deps): bump jinja2
	87f3125a0e45 chore(deps): bump jinja2 in the pip group across 1 director=
y
	b4530565c030 chore(deps): bump the pip group across 2 directories with 1=
 update
	11e5f92d3d43 build(deps): bump setuptools in the pip group across 1 dire=
ctory
	850389f4acfe chore(deps): bump micromatch

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ptool-native_2.12.0.bb =3D> fiptool-native_2.12.1.bb} |  6 +++---
 ...rmware-a_2.12.0.bb =3D> trusted-firmware-a_2.12.1.bb} | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.12.0.bb=
 =3D> fiptool-native_2.12.1.bb} (90%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.12.=
0.bb =3D> trusted-firmware-a_2.12.1.bb} (77%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.1.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.0=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.1.b=
b
index e7fbb8b499ef..98c8edda730c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.1.bb
@@ -9,9 +9,9 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
-# Use fiptool from TF-A v2.12.0
-SRCREV =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
-SRCBRANCH =3D "master"
+# Use fiptool from TF-A v2.12.1
+SRCREV =3D "8cf9edba5cc3ec11ed5463f206aa5819f7fdbade"
+SRCBRANCH =3D "lts-v2.12"
=20
 DEPENDS +=3D "openssl-native"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.1.bb
similarity index 77%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
12.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12=
.1.bb
index ceaac263fc75..57c30b581797 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.b=
b
@@ -1,15 +1,15 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.12.0
-SRCREV_tfa =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
-SRCBRANCH =3D "master"
+# TF-A v2.12.1
+SRCREV_tfa =3D "8cf9edba5cc3ec11ed5463f206aa5819f7fdbade"
+SRCBRANCH =3D "lts-v2.12"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.1
+# mbedtls-3.6.2
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
-SRCREV_mbedtls =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
--=20
2.39.5 (Apple Git-154)


