Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10745.1597222089490779874
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 01:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48BAD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 01:48:08 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773ED3F22E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 01:48:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/layer.conf: unify on a layer priority of 5
Date: Wed, 12 Aug 2020 09:48:03 +0100
Message-Id: <20200812084803.3235721-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

This layer may want to ship older versions of software than oe-core for
some BSPs (such as u-boot), but we don't want to force those downgrades
on everyone else.  Unfortunately because the meta-arm layers have
priority 6, any recipe in this layer wins over newer versions in oe-core:
for example with an older release of u-boot in meta-arm, simply adding
meta-arm to BBLAYERS will result in qemux86 downgrading u-boot.

Solve this by lowering meta-arm's priority to match oe-core, so that
recipes are treated equally and the usual version ordering applies.

Change-Id: I6de7a6b493e71b8b88862018b9fa35608342c1b2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 14a5922..d53c40a 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
=20
 BBFILE_COLLECTIONS +=3D "meta-arm"
 BBFILE_PATTERN_meta-arm =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arm =3D "6"
+BBFILE_PRIORITY_meta-arm =3D "5"
=20
 LAYERDEPENDS_meta-arm =3D " \
     core \
--=20
2.26.2

