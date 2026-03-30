Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B846FB3D19
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48193.1774868089603890297
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mZxs+Rfh;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D1641E8D;
	Mon, 30 Mar 2026 03:54:43 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFF7E3F915;
	Mon, 30 Mar 2026 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868089; bh=E7f1c2DmRKtKQMXlAN35IYKAP1S1J/SXIxVql4IaKyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZxs+RfhHjZsojHH/l6/JtYWzfL9CTNrhb20Pv9HSvX5963s/x9cZaYunFSzgCqI2
	 BEU8T4doqecDeLlhh7ruUYssOPIHlyglcINhVP+c7fZzEt2HP/w7v3vMrYXD+23kDt
	 ES61U2X6Z3EoWvO2Z90T5j00LZwqChTxGCtvSvPY=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 6/7] arm-bsp/docs: corstone1000: document Cortex-A320 SMP support
Date: Mon, 30 Mar 2026 11:43:16 +0100
Message-ID: <20260330105428.2580463-7-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6987

Corstone-1000 with Cortex-A320 FVP now supports SMP, so update the
documentation to reflect the current status.

Update the user guide to state that SMP is supported on Corstone-1000 wit=
h
Cortex-A35 FVP and on Corstone-1000 with Cortex-A320 FVP.
Add the Cortex-A320 multicore build and run commands.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 2a35f432..f40f5092 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -2182,22 +2182,41 @@ Symmetric Multiprocessing
=20
 .. warning::
=20
-    Symmetric multiprocessing (SMP) mode is only supported on Corstone-1=
000 with Cortex-A35 FVP but is disabled by default.
+    Symmetric multiprocessing (SMP) mode is supported on Corstone-1000
+    with Cortex-A35 FVP and Corstone-1000 with Cortex-A320 FVP, but is d=
isabled by default.
=20
=20
-#. Build the software stack with SMP mode enabled:
+#. Build the software stack with SMP mode enabled.
+
+   For Corstone-1000 with Cortex-A35 FVP:
=20
     .. code-block:: console
=20
         kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-multicore.yml
=20
-#. Run the Corstone-1000 FVP:
+   For Corstone-1000 with Cortex-A320 FVP:
+
+    .. code-block:: console
+
+        kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
+        meta-arm/kas/corstone1000-multicore.yml
+
+#. Run the Corstone-1000 FVP.
+
+   For Corstone-1000 with Cortex-A35 FVP:
=20
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-multicore.yml \
         -c "../meta-arm/scripts/runfvp"
=20
+   For Corstone-1000 with Cortex-A320 FVP:
+
+    .. code-block:: console
+
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
+        meta-arm/kas/corstone1000-multicore.yml \
+        -c "../meta-arm/scripts/runfvp"
=20
 #. Verify that the FVP is running the Host Processor with more than one =
CPU core:
=20

