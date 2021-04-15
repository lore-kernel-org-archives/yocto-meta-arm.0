Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4541.1618478973043865648
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 800D612FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8D73F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] CI: make update-repos a bit more verbose
Date: Thu, 15 Apr 2021 10:29:27 +0100
Message-Id: <20210415092929.3153651-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415092929.3153651-1-ross.burton@arm.com>
References: <20210415092929.3153651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ibb7b652b13b6d036c36fce076e7c1807f2ff37d7
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/update-repos | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kas/update-repos b/kas/update-repos
index 48711e3..a68257b 100755
--- a/kas/update-repos
+++ b/kas/update-repos
@@ -36,6 +36,8 @@ if __name__ =3D=3D "__main__":
     for repo in repositories:
         repodir =3D base_repodir / repo_shortname(repo)
         if repodir.exists():
+            print("Updating %s..." % repo)
             subprocess.run(["git", "-C", repodir, "fetch"], check=3DTrue=
)
         else:
+            print("Cloning %s..." % repo)
             subprocess.run(["git", "clone", "--bare", repo, repodir], ch=
eck=3DTrue)
--=20
2.25.1

