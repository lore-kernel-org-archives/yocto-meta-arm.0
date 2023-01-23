Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD4AC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:52:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42847.1674481977516032895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 05:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB976C14;
	Mon, 23 Jan 2023 05:53:38 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.89.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A179F3F64C;
	Mon, 23 Jan 2023 05:52:56 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/4][langdale] classes: Prevent passing None to the runfvp environment
Date: Mon, 23 Jan 2023 13:52:38 +0000
Message-Id: <20230123135239.3793628-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123135239.3793628-1-peter.hoyes@arm.com>
References: <20230123135239.3793628-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 13:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4316

From: Peter Hoyes <Peter.Hoyes@arm.com>

FVP_ENV_PASSTHROUGH may contain variables that have not been set.
d.getVar returns None in this case. Detect this and skip setting the
variable in the model environment.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index 0c0f9d2d..da0580b0 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -73,7 +73,8 @@ python do_write_fvpboot_conf() {
=20
     data["env"] =3D {}
     for var in d.getVar("FVP_ENV_PASSTHROUGH").split():
-        data["env"][var] =3D d.getVar(var)
+        if d.getVar(var) is not None:
+            data["env"][var] =3D d.getVar(var)
=20
     os.makedirs(os.path.dirname(conffile), exist_ok=3DTrue)
     with open(conffile, "wt") as f:
--=20
2.34.1


