Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B367C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 16:23:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23740.1678465400147936181
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Mar 2023 08:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3C8BC14
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:24:02 -0800 (PST)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49A393F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:23:19 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/optee: remove unused recipes
Date: Thu,  9 Mar 2023 16:15:19 -0500
Message-Id: <20230309211521.496531-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 16:23:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4483

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client/tee-supplicant.service | 10 ----
 .../optee/optee-client/tee-supplicant.sh      | 46 -------------------
 .../optee/optee-client_3.14.0.bb              |  3 --
 .../recipes-security/optee/optee-os_3.10.0.bb |  3 --
 4 files changed, 62 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-=
supplicant.service
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-=
supplicant.sh
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.14=
.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.b=
b

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplic=
ant.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-suppli=
cant.service
deleted file mode 100644
index c273832d..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.ser=
vice
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=3DTEE Supplicant
-
-[Service]
-User=3Droot
-EnvironmentFile=3D-@sysconfdir@/default/tee-supplicant
-ExecStart=3D@sbindir@/tee-supplicant $OPTARGS
-
-[Install]
-WantedBy=3Dbasic.target
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplic=
ant.sh b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.=
sh
deleted file mode 100644
index b4d21950..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-
-# Source function library
-. /etc/init.d/functions
-
-NAME=3Dtee-supplicant
-PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
-DESC=3D"OP-TEE Supplicant"
-
-DAEMON=3D@sbindir@/$NAME
-
-test -f $DAEMON || exit 0
-
-test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
-test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
-
-SSD_OPTIONS=3D"--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
-
-set -e
-
-case $1 in
-    start)
-	    echo -n "Starting $DESC: "
-	    start-stop-daemon --start $SSD_OPTIONS
-        echo "${DAEMON##*/}."
-        ;;
-    stop)
-	    echo -n "Stopping $DESC: "
-	    start-stop-daemon --stop $SSD_OPTIONS
-        echo "${DAEMON##*/}."
-        ;;
-    restart|force-reload)
-	    $0 stop
-	    sleep 1
-	    $0 start
-        ;;
-    status)
-        status ${DAEMON} || exit $?
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb
deleted file mode 100644
index 641fb0a0..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb
deleted file mode 100644
index 19beaa7c..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"
--=20
2.25.1


