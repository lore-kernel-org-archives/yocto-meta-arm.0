Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F09AE7F154
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20405.1696000897953788151
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6EC31007;
	Fri, 29 Sep 2023 08:22:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1576A3F5A1;
	Fri, 29 Sep 2023 08:21:36 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 09/10] CI: use a venv for sphinx
Date: Fri, 29 Sep 2023 16:21:27 +0100
Message-Id: <20230929152128.3401009-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5089

From: Ross Burton <ross.burton@arm.com>

The Kas container in version 4 onwards is based on Debian 12, which
forbids pip from installing files into /usr or ~/.local/.

We want to install the arbitrary dependencies for the documentation
build, so these should be installed in a venv.

The kas container doesn't currently install python3-venv, so we have to
install that manually (patch sent upstream).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c750698d..7e1a77cd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -288,7 +288,14 @@ documentation:
   extends: .setup
   script:
     - |
-      sudo pip3 install -r meta-arm-bsp/documentation/requirements.txt
+      # This can be removed when the kas container has python3-venv inst=
alled
+      sudo apt-get update && sudo apt-get install --yes python3-venv
+
+      python3 -m venv venv
+      . ./venv/bin/activate
+
+      pip3 install -r meta-arm-bsp/documentation/requirements.txt
+
       for CONF in meta-*/documentation/*/conf.py ; do
         echo Building $CONF...
         SOURCE_DIR=3D$(dirname $CONF)
--=20
2.34.1


