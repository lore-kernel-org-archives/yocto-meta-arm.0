Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EC1C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:20:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.61002.1749478850697783913
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 07:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D007D150C
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Jun 2025 07:20:30 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EF103F673
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Jun 2025 07:20:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update sstate-mirror.yml
Date: Mon,  9 Jun 2025 10:20:48 -0400
Message-Id: <20250609142048.85350-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 14:20:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6536

The Yocto project changed the server name for sstate, though the
previous one does still appear to work.  Update here to the one matching
the YP documentation.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/sstate-mirror.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/sstate-mirror.yml b/ci/sstate-mirror.yml
index 4bcbd760c59f..98e99593817f 100644
--- a/ci/sstate-mirror.yml
+++ b/ci/sstate-mirror.yml
@@ -6,6 +6,6 @@ header:
 local_conf_header:
   sstate_mirror: |
     BB_HASHSERVE_UPSTREAM =3D "wss://hashserv.yoctoproject.org/ws"
-    SSTATE_MIRRORS =3D "file://.* http://cdn.jsdelivr.net/yocto/sstate/a=
ll/PATH;downloadfilename=3DPATH"
+    SSTATE_MIRRORS =3D "file://.* http://sstate.yoctoproject.org/all/PAT=
H;downloadfilename=3DPATH"
     BB_HASHSERVE =3D "auto"
     BB_SIGNATURE_HANDLER =3D "OEEquivHash"
--=20
2.39.5 (Apple Git-154)


