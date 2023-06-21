Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38E2EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:36:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66.1687358174344516648
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8DD4113E;
	Wed, 21 Jun 2023 07:36:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F6713F64C;
	Wed, 21 Jun 2023 07:36:13 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] CI: print the name of the documentation when building
Date: Wed, 21 Jun 2023 15:36:10 +0100
Message-Id: <20230621143610.1024837-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621143610.1024837-1-ross.burton@arm.com>
References: <20230621143610.1024837-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jun 2023 14:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4815

From: Ross Burton <ross.burton@arm.com>

Make it clear what documentation tree is being built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f700ee0f..b2246743 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -282,6 +282,7 @@ documentation:
     - |
       sudo pip3 install -r meta-arm-bsp/documentation/requirements.txt
       for CONF in meta-*/documentation/*/conf.py ; do
+        echo Building $CONF...
         SOURCE_DIR=3D$(dirname $CONF)
         MACHINE=3D$(basename $SOURCE_DIR)
         sphinx-build -vW $SOURCE_DIR build-docs/$MACHINE
--=20
2.34.1


