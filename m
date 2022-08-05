Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3709CC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:48:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7835.1659710891946974819
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49FC5106F;
	Fri,  5 Aug 2022 07:48:12 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.84.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 855953F73B;
	Fri,  5 Aug 2022 07:48:10 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] docs: Update FVP_CONSOLES in runfvp documentation
Date: Fri,  5 Aug 2022 15:47:55 +0100
Message-Id: <20220805144756.2492832-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Aug 2022 14:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3650

From: Peter Hoyes <Peter.Hoyes@arm.com>

The runfvp refactor to enable OEFVPSerialTarget created FVP_CONSOLES
which maps the names used for serial ports in test cases to the names
used for serial ports in the FVP stdout.

Refactor the FVP_CONSOLE section -> FVP_CONSOLES, noting the the
'default' console is still used for the --console runfvp flag.

Issue-Id: SCM-4954
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ieb13d74cfd425900f44b4b2e6d125393e7b456ad
---
 documentation/runfvp.md | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index b9e007b..c792f4e 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -98,13 +98,16 @@ FVP_TERMINALS[bp.terminal_2] =3D ""
 FVP_TERMINALS[bp.terminal_3] =3D ""
 ```
=20
-### `FVP_CONSOLE`
+### `FVP_CONSOLES`
=20
-This specifies what serial port is used when `--console` is passed to ru=
nfvp. Note that this has to be the FVP identifier but without the board p=
refix, for example:
+This specifies what serial ports can be used in oeqa tests, along with a=
n alias to be used in the test cases. Note that the values have to be the=
 FVP identifier but without the board prefix, for example:
 ```
-FVP_CONSOLE =3D "terminal_0"
+FVP_CONSOLES[default] =3D "terminal_0"
+FVP_CONSOLES[tf-a] =3D "s_terminal_0"
 ```
=20
+The 'default' console is also used when `--console` is passed to runfvp.
+
 ### `FVP_EXTRA_ARGS`
=20
 Arbitrary extra arguments that are passed directly to the FVP.  For exam=
ple:
--=20
2.25.1


