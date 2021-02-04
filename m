Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.974.1612462455036426299
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D591424
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:14 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01A983F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:13 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] gem5/gem5-aarch64-native: use oe-run-native
Date: Thu,  4 Feb 2021 13:14:05 -0500
Message-Id: <20210204181405.20275-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
References: <20210204181405.20275-1-jon.mason@arm.com>

From: Adrian Herrera <adrian.herrera@arm.com>

Persist gem5 binary in native sysroot. This allows executing the binary
with the standard oe-run-native script. We can also remove the wrapper
creation and the ".real" versioning, since paths are setup by oe-run-native.

Change-Id: I9fd46725c78e1a09a7142a9d343b140bb5a77088
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/recipes-devtools/gem5/files/start-gem5.sh |  2 +-
 meta-gem5/recipes-devtools/gem5/gem5-native.inc     | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh b/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
index 4edc0e5..6335411 100644
--- a/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
+++ b/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
@@ -34,6 +34,6 @@ if [ -n "${GEM5_RUN_EXTRA}" ]; then
     args="$args ${GEM5_RUN_EXTRA}"
 fi
 
-${STAGING_BINDIR_NATIVE}/${GEM5_RUN_CONFIG} \
+oe-run-native gem5-aarch64-native ${GEM5_RUN_CONFIG} \
     ${STAGING_DATADIR_NATIVE}/gem5/${GEM5_RUN_PROFILE} ${args} "$@"
 
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
index 06c03e4..1462b4e 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -41,14 +41,7 @@ do_install() {
     for f in ${GEM5_BUILD_CONFIGS}; do
         destname=$(basename $f)
         install -d ${D}${bindir}
-        install -m 755 $f ${D}${bindir}/$destname.real
-        cat <<EOF > ${D}${bindir}/$destname
-#!/bin/bash
-basedir=\$(cd \$(dirname \$0)/../../; pwd)
-export LD_LIBRARY_PATH="\$basedir/lib:\$basedir/usr/lib"
-\$basedir/usr/bin/$destname.real "\$@"
-EOF
-        chmod a+x ${D}${bindir}/$destname
+        install -m 755 $f ${D}${bindir}/$destname
     done
 }
 
@@ -56,3 +49,4 @@ FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
 INSANE_SKIP_${PN} += "already-stripped"
 RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native libpng-native"
 
+addtask addto_recipe_sysroot before do_build
-- 
2.17.1

