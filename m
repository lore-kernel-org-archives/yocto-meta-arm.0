Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55DFC021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10384.1740496699352537481
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 187C31BCB
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:35 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFE4B3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:18 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/trusted-firmware-a: update the LTS to v2.10.12
Date: Tue, 25 Feb 2025 10:18:14 -0500
Message-Id: <20250225151817.11875-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6389

Update trusted-firmware-a to lts-v2.10.12
Changes between 7e63213601425c7a6d83e47dc936b264deb9df2b and 408ba4ddfe9a=
8d55e3e2488bea89c39adef07981
	408ba4ddfe9a docs(changelog): changelog for lts-v2.10.12 release
	7bdf51628eab Merge "docs(maintainers): update LTS maintainers" into lts-=
v2.10
	8355ef7728ec docs(maintainers): update LTS maintainers
	faceedf4e5c2 Merge changes from topic "for-lts-v2.10.12" into lts-v2.10
	9007a3344e12 Merge changes from topic "gr/lts-doc-2.10" into lts-v2.10
	924c7f42ce4a chore(deps): bump cross-spawn
	7c8c034e5fed chore(deps): bump jinja2 in the pip group across 1 director=
y
	3d85a19f2f54 docs: updates to LTS
	13657a3f3f2a docs: add inital lts doc
	a4c57c122407 Merge changes from topic "lts-v2.10.12" into lts-v2.10
	564922601397 feat(mbedtls): mbedtls config update for v3.6.2
	44161dcb10ab docs(prerequisites): update mbedtls to version 3.6.2
	0ac65e7aa5ec refactor(mbedtls): rename default mbedtls confs
	8b2c885739dd fix(arm): add extra hash config to validate ROTPK
	832b92b7f615 docs(changelog): changelog for lts-v2.10.11 release
	a3fc7c18c461 Merge changes from topic "for-lts-2.10.11" into lts-v2.10
	196984e65da0 fix(cpus): workaround for Cortex-X4 erratum 2923985
	0eed05ee70aa chore(cpus): optimise runtime errata applications
	34e6d7cb8ce1 Merge changes from topic "sm/fix_erratum" into lts-v2.10
	ad9dfdc5800c fix(cpus): workaround for CVE-2024-5660 for Cortex-X2
	5673d345aaa3 fix(cpus): workaround for CVE-2024-5660 for Cortex-A77
	4fd2a6702dd1 fix(cpus): workaround for CVE-2024-5660 for Neoverse-V1
	a02a863d3156 fix(cpus): workaround for CVE-2024-5660 for Cortex-A78_AE
	87250d2bb1ea fix(cpus): workaround for CVE-2024-5660 for Cortex-A78C
	30c57c58abe3 fix(cpus): workaround for CVE-2024-5660 for Cortex-A78
	c7d3c9eb2d81 fix(cpus): workaround for CVE-2024-5660 for Cortex-X1
	282e63544d26 fix(cpus): workaround for CVE-2024-5660 for Neoverse-N2
	f7ae819f03ae fix(cpus): workaround for CVE-2024-5660 for Cortex-A710
	3efc9e13011d fix(cpus): workaround for CVE-2024-5660 for Neoverse-V2
	17e17ed3f1e6 fix(cpus): workaround for CVE-2024-5660 for Cortex-X3
	a6375e1feb42 fix(cpus): workaround for CVE-2024-5660 for Neoverse-V3
	e42abf298321 fix(cpus): workaround for CVE-2024-5660 for Cortex-X4
	698e68fe1fe9 fix(cpus): workaround for CVE-2024-5660 for Cortex-X925
	b229b47bd86c chore: rename Blackhawk to Cortex-X925
	96498991d1ce chore: rename Chaberton to Cortex-A725
	b28aa38e28cf docs(changelog): changelog for lts-v2.10.10 release
	8e74814ce52f Merge changes from topic "for-lts-v2.10.10" into lts-v2.10
	c9f3fb5822dc build(deps): bump setuptools in the pip group across 1 dire=
ctory
	395ef3534cf1 chore(deps): bump micromatch
	6c6e986bffb3 build(npm): update Node.js and all packages
	c5d2a030a35f build(deps): bump braces
	ebf6430a01c5 build(deps): bump idna from 3.4 to 3.7
	93ad43e79ef7 build(deps): bump jinja2 from 3.1.2 to 3.1.4
	f8a06a0f82ce build(deps): bump urllib3 from 2.0.2 to 2.2.2
	3ea256c36a4b build(deps): bump pip from 23.1.2 to 23.3

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...firmware-a_2.10.9.bb =3D> trusted-firmware-a_2.10.12.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
9.bb =3D> trusted-firmware-a_2.10.12.bb} (82%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.9.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.12.bb
similarity index 82%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.9.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.12.bb
index febdcb4bace7..5454e84cc8aa 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.12.=
bb
@@ -1,15 +1,15 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.9
-SRCREV_tfa =3D "7e63213601425c7a6d83e47dc936b264deb9df2b"
+# TF-A v2.10.12
+SRCREV_tfa =3D "408ba4ddfe9a8d55e3e2488bea89c39adef07981"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
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


