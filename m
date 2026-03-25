Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1119E109C04D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 18:06:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29903.1774462000805537863
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 11:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vwiW/nxe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663882444
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 11:06:34 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 431843FC23
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774462000; bh=qBlTZFLazOydPJUtvVGRV2dm5h4h0myXyXwUyzKjcCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vwiW/nxeVTste194yTeeb3qdHYHkSK7xbYAWvZT1HYERTOF48TAOzDMnQDH1DMIrT
	 sZOzFwBDNKNojkL9C7AfCFbm1WAZONcHi4uyo5yoDfD0PyawBPcqMBXJFcVf1qyzGg
	 d/sWh6oaQofbEtuYGuArNGCkpTk86GVf4iEzc/zY=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/optee: add UPSTREAM_CHECK_COMMITS for git recipes
Date: Wed, 25 Mar 2026 14:06:39 -0400
Message-ID: <20260325180639.88517-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260325180639.88517-1-jon.mason@arm.com>
References: <20260325180639.88517-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 18:06:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6971

Seeing UNKNOWN_BROKEN in the OP-TEE git recipes.  Add
UPSTREAM_CHECK_COMMITS to address this issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-client_git.bb      | 1 +
 meta-arm/recipes-security/optee/optee-examples_git.bb    | 1 +
 meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb | 1 +
 meta-arm/recipes-security/optee/optee-os_git.bb          | 1 +
 meta-arm/recipes-security/optee/optee-test_git.bb        | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-a=
rm/recipes-security/optee/optee-client_git.bb
index b974e012affa..24e2d1941299 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -3,6 +3,7 @@ require recipes-security/optee/optee-client.inc
 # v4.9.0
 SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
 PV .=3D "+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # Not a release recipe, try our hardest to not pull this in implicitly
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta=
-arm/recipes-security/optee/optee-examples_git.bb
index e0c85660a8a3..4fda635b72eb 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -3,6 +3,7 @@ require recipes-security/optee/optee-examples.inc
 # v4.8.0
 SRCREV =3D "3ef17eb1f309def91113637f95f67613b1d89119"
 PV .=3D "+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # Not a release recipe, try our hardest to not pull this in implicitly
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb b/m=
eta-arm/recipes-security/optee/optee-os-tadevkit_git.bb
index 78588b8111f4..64765df00c2f 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb
@@ -1,4 +1,5 @@
 require recipes-security/optee/optee-os_${PV}.bb
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SUMMARY =3D "OP-TEE Trusted OS TA devkit"
 DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/r=
ecipes-security/optee/optee-os_git.bb
index 244ff9b71877..03b0f1cc74fd 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -5,6 +5,7 @@ DEPENDS +=3D "dtc-native"
 # v4.8.0
 SRCREV =3D "86660925433a8d4d1b19cfa5fe940081d77b34b4"
 PV .=3D "+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # Not a release recipe, try our hardest to not pull this in implicitly
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm=
/recipes-security/optee/optee-test_git.bb
index 37b00908b577..1d4ee44ea77d 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -3,6 +3,7 @@ require recipes-security/optee/optee-test.inc
 # v4.8.0
 SRCREV =3D "6569cd7b13e1b37b37069e090d592adca7d3926d"
 PV .=3D "+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560 \
                     file://LICENSE-BSD;md5=3Ddca16d6efa93b55d0fd662ae5cd=
6feeb \
--=20
2.50.1 (Apple Git-155)


