Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C11C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38157.1634571660558758299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 578012F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:40:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020DF3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:40:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] runfvp: reset the process group on startup
Date: Mon, 18 Oct 2021 16:40:51 +0100
Message-Id: <20211018154056.1552230-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2275

So that it is easy to kill runfvp and everything it starts (such as
telnet or the FVP itself), reset the process group on startup.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/runfvp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runfvp b/scripts/runfvp
index a5a436e8..97836726 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -217,6 +217,9 @@ def runfvp(cli_args):
=20
 if __name__ =3D=3D "__main__":
     try:
+        # Set the process group so that it's possible to kill runfvp and
+        # everything it spawns easily.
+        os.setpgid(0, 0)
         runfvp(sys.argv[1:])
     except KeyboardInterrupt:
         pass
--=20
2.25.1


