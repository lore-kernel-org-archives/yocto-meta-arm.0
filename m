Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685D3C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:47:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20064.1782823634646457568
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lYf3HJTP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA8042C46;
	Tue, 30 Jun 2026 05:47:09 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1D803F905;
	Tue, 30 Jun 2026 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823634; bh=bybrBVhkSbnuMk2wPfhh70xPbiu0DURAuS7DzljzT/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lYf3HJTPtovz8sPX8EhC7enrXAXWd/IwL1y2KbGDFbDHk7IOCX3xzmEm50sXApFzO
	 AytrAIjq0jriAkiAHDmGgtQokrdITG9KqhCYxkLu70qmq6eMqqpzD5LNs+A9+Hw3xz
	 9hNS5c9cgMB2Y8cZfkfNHtl55NmlmoM4zGATcoFE=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH wrynose 3/5] corstone1000: Pin layers SHA for wrynose release
Date: Tue, 30 Jun 2026 13:47:02 +0100
Message-Id: <20260630124704.301310-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
References: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7102

Pinned layers in corstone1000-base.yml

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 kas/corstone1000-base.yml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 4438bcb8..4eecde4f 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,21 +5,25 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: wrynose
=20
 repos:
   bitbake:
     url: https://git.openembedded.org/bitbake
+    branch: "2.18"
+    commit: 22021758e66737bcf68dfd2b74adc6a0cb1d42d9
     layers:
       bitbake: disabled
=20
   core:
     url: https://git.openembedded.org/openembedded-core
+    commit: 06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80
     layers:
       meta:
=20
   meta-yocto:
     url: https://git.yoctoproject.org/meta-yocto
+    commit: 8251bdad5fda780a000fb41e6eda82eadf0fa39e
     layers:
       meta-poky:
=20
@@ -31,7 +35,7 @@ repos:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
+    commit: 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71
     layers:
       meta-oe:
       meta-python:
@@ -39,7 +43,7 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: 59d7e90542947c342098863b9998693ac79352b0
+    commit: 07a99ae241acd488a2feda1ededf87dc70dfde80
     layers:
       meta-secure-core-common:
       meta-signing-key:

