Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999EDC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:04:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48631.1723475081867718000
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 08:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5697B106F;
	Mon, 12 Aug 2024 08:05:07 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.80.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40073F6A8;
	Mon, 12 Aug 2024 08:04:40 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>
Subject: [PATCH 2/2] arm-bsp/documentation: corstone1000: Install Sphinx theme as recommended
Date: Mon, 12 Aug 2024 16:04:17 +0100
Message-Id: <20240812150417.157272-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812150417.157272-1-hugues.kambampiana@arm.com>
References: <20240812150417.157272-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Aug 2024 15:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5962

From: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>

Read the Docs recommends installing the Sphinx theme by listing
it as an enabled extensions prior to setting it as the active theme.

This commit adds it to the enabled extensions list as it was already
set as the active theme.

Signed-off-by: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/conf.py b/meta-arm-b=
sp/documentation/corstone1000/conf.py
index b932a52c..d8b558fa 100644
--- a/meta-arm-bsp/documentation/corstone1000/conf.py
+++ b/meta-arm-bsp/documentation/corstone1000/conf.py
@@ -32,6 +32,7 @@ author =3D 'Arm Limited'
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
 extensions =3D [
+    'sphinx_rtd_theme',
 ]
=20
 # Add any paths that contain templates here, relative to this directory.

