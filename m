Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A96EC4332F
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1.1643129988199538730
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 08:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3AEBD6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E9C93F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] scripts/machine-summary: remove obsolete is_old test
Date: Tue, 25 Jan 2022 16:59:33 +0000
Message-Id: <20220125165936.1456059-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 16:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2910

This test isn't used any more, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 1f98f247..5e66cc1b 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -154,12 +154,6 @@ class Format:
             trim_blocks=3DTrue,
             lstrip_blocks=3DTrue
         )
-        def is_old(version, upstream):
-            if "+git" in version:
-                # strip +git and see if this is a post-release snapshot
-                version =3D version.replace("+git", "")
-            return version !=3D upstream
-        env.tests["old"] =3D is_old
=20
         return env.get_template(name)
=20
--=20
2.25.1


