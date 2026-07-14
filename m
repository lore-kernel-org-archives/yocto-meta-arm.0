Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2F0C4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 15:44:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11956.1784043891910162052
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 08:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FAXiFM12;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF935339
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 08:44:46 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06ACA3F915
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784043891; bh=jBde1p/y5ogmsNl5pZlHzPlepf2ngqTWmPCljzLRuTk=;
	h=From:To:Subject:Date:From;
	b=FAXiFM12qZTlALjTgEumTUCoXW5YkhprnchJgc0T6qbKMJ1CRFIg7hjzUimHtjeNf
	 f04Q0x1YctwGcaPsQsvrZxXnPQJCVNqn2XuoIlNqdgGka5AvnulK3S4kUq6Kbtnv3o
	 kcI8GpQ3O8KCe7gsWwsAo9PsnxM2KJvlUh673gqs=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: fix sstate-mirror
Date: Tue, 14 Jul 2026 11:44:50 -0400
Message-ID: <20260714154450.64006-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 15:44:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7117

We should be using OE_FRAGMENTS for the upstream sstate mirror, and
BB_HASHSERVE is in base.yml

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/sstate-mirror.yml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ci/sstate-mirror.yml b/ci/sstate-mirror.yml
index 98e99593817f..df9d4e031082 100644
--- a/ci/sstate-mirror.yml
+++ b/ci/sstate-mirror.yml
@@ -5,7 +5,5 @@ header:
=20
 local_conf_header:
   sstate_mirror: |
-    BB_HASHSERVE_UPSTREAM =3D "wss://hashserv.yoctoproject.org/ws"
-    SSTATE_MIRRORS =3D "file://.* http://sstate.yoctoproject.org/all/PAT=
H;downloadfilename=3DPATH"
-    BB_HASHSERVE =3D "auto"
     BB_SIGNATURE_HANDLER =3D "OEEquivHash"
+    OE_FRAGMENTS +=3D "core/yocto/sstate-mirror-cdn"
--=20
2.50.1 (Apple Git-155)


