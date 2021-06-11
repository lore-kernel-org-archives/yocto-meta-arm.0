Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10095.1623425572405458092
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 08:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D66E1FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:32:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98DC3F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:32:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] runfvp: exit with the return code of the FVP binary
Date: Fri, 11 Jun 2021 16:32:44 +0100
Message-Id: <20210611153246.2555026-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: If79e31e61110161c9a13dd512b0146d1d515d77a
Signed-off-by: Ross Burton <ross.burton@arm.com>
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

