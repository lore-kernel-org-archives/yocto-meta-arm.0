Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0701C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 12:50:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.46.1633438201299851279
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 05:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7976D;
	Tue,  5 Oct 2021 05:50:00 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.37.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9FD13F70D;
	Tue,  5 Oct 2021 05:49:59 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-bsp/fvp-baser-aemv8r64/docs: Add instructions to
 build previous versions
Date: Tue,  5 Oct 2021 13:49:28 +0100
Message-Id: <20211005124930.3490492-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Oct 2021 12:50:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2250

This patch adds instructions to fetch and build previous versions of the
software stack for fvp-baser-aemv8r64 instead of the ongoing
development.

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I430196c0ca80c7f1e4b9f8349cdc957c86f384ee
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index ca01a14..97a88ff 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -70,6 +70,13 @@ The variables should be set like so:
 for the next steps to work correctly.
=20
 ### Fetch sources
+To fetch and build the ongoing development of the software stack follow =
the
+instructions on this document.
+
+To fetch and build the version 1 (single core) find instructions at http=
s://community.arm.com/developer/tools-software/oss-platforms/w/docs/633/r=
elease-1-single-core
+
+To fetch and build the version 2 (linux smp) find instructions at https:=
//community.arm.com/developer/tools-software/oss-platforms/w/docs/634/rel=
ease-2---smp
+
 Fetch the meta-arm repository into a build directory:
=20
     mkdir -p ~/fvp-baser-aemv8r64-build
--=20
2.25.1


