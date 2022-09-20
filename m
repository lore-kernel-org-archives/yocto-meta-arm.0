Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416CCC32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5912.1663765131511756723
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E9481F91
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0385B3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/optee-client: move the 3.14 recipe to meta-arm-bsp
Date: Tue, 20 Sep 2022 18:38:46 -0400
Message-Id: <20220920223846.8000-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920223846.8000-1-jon.mason@arm.com>
References: <20220920223846.8000-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3799

Only corstone1000 is using the legacy version of optee-client.  Move it
there to keep corstone1000 working, while removing it from meta-arm to
discourage use of the non-latest version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client/tee-supplicant.service | 10 ++++
 .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
 .../optee/optee-client_3.14.0.bb              |  2 +-
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
 rename {meta-arm => meta-arm-bsp}/recipes-security/optee/optee-client_3.14.0.bb (52%)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
new file mode 100644
index 00000000..c273832d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=TEE Supplicant
+
+[Service]
+User=root
+EnvironmentFile=-@sysconfdir@/default/tee-supplicant
+ExecStart=@sbindir@/tee-supplicant $OPTARGS
+
+[Install]
+WantedBy=basic.target
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
new file mode 100644
index 00000000..b4d21950
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+# Source function library
+. /etc/init.d/functions
+
+NAME=tee-supplicant
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DESC="OP-TEE Supplicant"
+
+DAEMON=@sbindir@/$NAME
+
+test -f $DAEMON || exit 0
+
+test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
+test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
+
+SSD_OPTIONS="--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
+
+set -e
+
+case $1 in
+    start)
+	    echo -n "Starting $DESC: "
+	    start-stop-daemon --start $SSD_OPTIONS
+        echo "${DAEMON##*/}."
+        ;;
+    stop)
+	    echo -n "Stopping $DESC: "
+	    start-stop-daemon --stop $SSD_OPTIONS
+        echo "${DAEMON##*/}."
+        ;;
+    restart|force-reload)
+	    $0 stop
+	    sleep 1
+	    $0 start
+        ;;
+    status)
+        status ${DAEMON} || exit $?
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb
similarity index 52%
rename from meta-arm/recipes-security/optee/optee-client_3.14.0.bb
rename to meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb
index be78b880..641fb0a0 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb
@@ -1,3 +1,3 @@
-require optee-client.inc
+require recipes-security/optee/optee-client.inc
 
 SRCREV = "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
-- 
2.17.1


