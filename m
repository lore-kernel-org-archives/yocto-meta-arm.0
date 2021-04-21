Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14914.1619022355384403054
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 09:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8E3411FB;
	Wed, 21 Apr 2021 09:25:53 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.60.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5753F774;
	Wed, 21 Apr 2021 09:25:53 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy/docs: Change quickstart instructions to hardknott
Date: Wed, 21 Apr 2021 17:26:05 +0100
Message-Id: <20210421162605.1145301-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Issue-Id: SCM-2307
Change-Id: Ieb7a6d3280a7eba573a57b4e52e275adb0a208df
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b=
/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 3760676..12404a7 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -29,7 +29,7 @@ First you must download the Yocto layers needed:
  - all other layers you might want to use
=20
 For each of the downloaded layer make sure you checkout the release of Y=
octo
-you want to use (for example gatesgarth using `git checkout gatesgarth`)=
.
+you want to use (for example hardknott using `git checkout hardknott`).
=20
 Please follow [Yocto documentation](https://www.yoctoproject.org/docs/la=
test/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
 in order to have the required dependencies.
--=20
2.25.1

