Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.138.1623934309689084614
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9870106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 943FE3F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 6/9] runfvp: exit with the return code of the FVP binary
Date: Thu, 17 Jun 2021 13:51:40 +0100
Message-Id: <20210617125143.489231-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617125143.489231-1-ross.burton@arm.com>
References: <20210617125143.489231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross@burtonini.com>

Change-Id: If79e31e61110161c9a13dd512b0146d1d515d77a
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index d0e97d0..4ef0bfc 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -154,7 +154,7 @@ def runfvp(args):
             logger.error(f"{fvp_process.args[0]} quit with code {fvp_pro=
cess.returncode}:")
             logger.error(output)
     else:
-        subprocess.run(cli)
+        sys.exit(subprocess.run(cli).returncode)
=20
 if __name__ =3D=3D "__main__":
     runfvp(sys.argv)
--=20
2.25.1

