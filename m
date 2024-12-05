Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADFDE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 16:00:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14904.1733414397411567747
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 07:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21BA2169E;
	Thu,  5 Dec 2024 08:00:25 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.89.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76F773F5A1;
	Thu,  5 Dec 2024 07:59:56 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH styhead 2/3] kas: corstone-1000: Update the SHA of the Yocto layer dependencies for the CORSTONE1000-2024.11 release.
Date: Thu,  5 Dec 2024 15:59:47 +0000
Message-Id: <20241205155948.787069-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155948.787069-1-hugues.kambampiana@arm.com>
References: <20241205155948.787069-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Dec 2024 16:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6274

The SHA of the dependent community layers are commented out and set to
the tested SHA from the `styhead` branch of each layer.

The set SHAs are to be uncommented in the `styhead` branch which is
to be used to create the `CORSTONE1000-2024.11` tag.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-base.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index a8b98603..c36b294a 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -16,14 +16,14 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
-    # commit: 2e9c2a2381105f1306bcbcb54816cbc5d8110eff
+    # commit: 5465094be9a61a1639e1dab6d2b4ebea2bee7440
     layers:
       meta:
       meta-poky:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
+    # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
     layers:
       meta-oe:
       meta-python:
@@ -31,7 +31,7 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: e29165a1031dcf601edbed1733cedd64826672a5
+    # commit: 59d7e90542947c342098863b9998693ac79352b0
     layers:
       meta-secure-core-common:
       meta-signing-key:

