Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ED8C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30758.1632747368725587502
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FB62D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDDCE3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] runfvp: exit cleanly if tinfoil cannot be imported
Date: Mon, 27 Sep 2021 13:56:02 +0100
Message-Id: <20210927125602.3400822-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2235

If bb.tinfoil cannot be imported, display a nice error instead of a
backtrace.

Change-Id: I20dab9dfdbd57c8e90c8321072bab4f70b8ace47
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index e40bad0d..e9654268 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -34,7 +34,11 @@ def get_image_directory(machine=3DNone):
     Get the DEPLOY_DIR_IMAGE for the specified machine
     (or the configured machine if not set).
     """
-    import bb.tinfoil
+    try:
+        import bb.tinfoil
+    except ImportError:
+        logger.error("Cannot connect to BitBake, did you oe-init-build-e=
nv?")
+        sys.exit(1)
=20
     if machine:
         os.environ["MACHINE"] =3D machine
--=20
2.25.1


