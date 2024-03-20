Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F01C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 17:27:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51723.1710955643472366250
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 10:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F4661007
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 10:27:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91E4D3F762
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 10:27:22 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone] arm/opencsd: upgrade to 1.2.1 to fix kernel build
Date: Wed, 20 Mar 2024 17:27:20 +0000
Message-Id: <20240320172720.2233794-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 17:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5466

From: Ross Burton <ross.burton@arm.com>

Linux 5.15.149 contains the following change[1]:

    perf cs-etm: Bump minimum OpenCSD version to ensure a bugfix is prese=
nt

    Since commit d927ef5004ef ("perf cs-etm: Add exception level consiste=
ncy
    check"), the exception that was added to Perf will be triggered unles=
s
    the following bugfix from OpenCSD is present:
    [...]

The opencsd requirement is now 1.2.1 onwards, but the kirkstone branch
has 1.2.0.  The 1.2.1 release was just three bugfixes on top of 1.2.0 so
this should be a safe upgrade:

3fecfb0 opencsd: etm4x: Update etm4x / ete decoder to flush context to cl=
ient immediately.
db97bbc opencsd: decode: Update decoder base to implement memory accessor=
 invalidation.
a7b77aa opencsd: memaccess: Allow memory accessors to have cache invalida=
ted by decoder.

[1] a7af1be5cf5507dd6c157b7a25453942f805db76

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_1.2.0.bb =3D> opencsd_1.2.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.2.0.bb =3D> opencsd_=
1.2.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.2.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.2.1.bb
index 0ff4b172..26a370c9 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.2.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "dac554d62d514b202174506995afc0e109ef3fea"
+SRCREV =3D "539fea3eabd4ce7574494981cd3d0906cfdc5f18"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


