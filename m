Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3370C54E94
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:52:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42846.1674481975376590908
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 05:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6C40C14;
	Mon, 23 Jan 2023 05:53:36 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.89.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9C43F9A0;
	Mon, 23 Jan 2023 05:52:54 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/4][langdale] classes: Define FVP_ENV_PASSTHROUGH variable dependencies
Date: Mon, 23 Jan 2023 13:52:37 +0000
Message-Id: <20230123135239.3793628-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123135239.3793628-1-peter.hoyes@arm.com>
References: <20230123135239.3793628-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 13:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4315

From: Peter Hoyes <Peter.Hoyes@arm.com>

Define FVP_ENV_PASSTHROUGH's vardeps to equal itself, so that the
fvpconf is regenerated if any of the defined variables change.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index 508deb29..0c0f9d2d 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -25,6 +25,7 @@ FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 FVP_EXTRA_ARGS ?=3D ""
 # Bitbake variables to pass to the FVP environment
 FVP_ENV_PASSTHROUGH ?=3D "FASTSIM_DISABLE_TA"
+FVP_ENV_PASSTHROUGH[vardeps] =3D "${FVP_ENV_PASSTHROUGH}"
 # Disable timing annotation by default
 FASTSIM_DISABLE_TA ?=3D "1"
=20
--=20
2.34.1


