Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D980ACCA47A
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 13:50:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.18171.1655387437973618707
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 06:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A06AF12FC;
	Thu, 16 Jun 2022 06:50:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1896F3F7F5;
	Thu, 16 Jun 2022 06:50:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm/trusted-firmware-a: rename to 2.7.0 to match upstream
Date: Thu, 16 Jun 2022 14:50:34 +0100
Message-Id: <20220616135034.3787137-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616135034.3787137-1-ross.burton@arm.com>
References: <20220616135034.3787137-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 13:50:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3513

The upstream version is 2.7.0, so use that name instead of just 2.7.

Also remove the unversioned bbappend which simply extended
FILESEXTRAPATHS, there's no need for this split now that we aim to have
~1 version of TF-A in the tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{tf-a-tests_2.7.bbappend =3D> tf-a-tests_2.7.0.bbappend}     | 0
 .../trusted-firmware-a/trusted-firmware-a_2.%.bbappend         | 3 ---
 ...rmware-a_2.7.bbappend =3D> trusted-firmware-a_2.7.%.bbappend} | 2 ++
 .../{tf-a-tests_2.7.bb =3D> tf-a-tests_2.7.0.bb}                 | 0
 .../{trusted-firmware-a_2.7.bb =3D> trusted-firmware-a_2.7.0.bb} | 0
 5 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.7.bbapp=
end =3D> tf-a-tests_2.7.0.bbappend} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.%.bbappend
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2=
.7.bbappend =3D> trusted-firmware-a_2.7.%.bbappend} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.7.bb =3D> t=
f-a-tests_2.7.0.bb} (100%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.7.b=
b =3D> trusted-firmware-a_2.7.0.bb} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.b=
bappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb=
append
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb=
append
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb=
append
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.%.bbappend
deleted file mode 100644
index f317cb8c..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.=
bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
-
-# Don't put machine customisation in here, use a versioned append.
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.7.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.7.%.bbappend
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_2.7.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.7.%.bbappend
index f8b2ac1b..09ed3f79 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.=
%.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
+
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.7.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.=
bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
7.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.=
0.bb
--=20
2.25.1


