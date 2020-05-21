Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.6884.1590070989771770172
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2020 07:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rqJ1pEqw;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id k7so3136036pjs.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2020 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J+tATLKVaOBrU1ZB6YZDvXaBqWBQfHFldpzN4DssxeU=;
        b=rqJ1pEqww4DWFr+c/aFS903eqeIj5HGvx+ibVfV3AEHy4SEgvUpMX2WK0LDfpDSPCd
         8T4RmrBxGqFV7czneFKlBte3gzYxuJ2HA0QoDF8K6ryHvC+o3PGlZmKXeIbQRyqhEM4t
         H9NCjuCSjHac7KSJ3x3EBjhaNOBwvAvxJPpIrRnHv7ant1SiNtGMaNT8ROnTX7l0aplZ
         0T7YblnD3htxU4ezwc0V7Ooo1JT5QczPWF7NSj0PuYoJ+hu3hfSi9iXTIKSNec2zpSX1
         6f5lzacyHEgkfv9HNu21+Hnpg1NjdKbGO1QJnS1vMHHWNEaDKSPwDg3kmMqXRUTGS7S+
         WbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J+tATLKVaOBrU1ZB6YZDvXaBqWBQfHFldpzN4DssxeU=;
        b=tGod8YrlDEwLPvSofQxU5w9QzeuReJmWl+9PuKyZmi3sT4JfmOUq5UK3MniWesJGXb
         aD1O1ZjYMIrbn4Dev8KwUQ3tZf65vScTAqyUKy1hivVag49PUHo0jrza/vqVezV1nBqA
         QZQxzrqcpHQswasZD4HBGrwKS9jGeh4l/OcR3ICTHwryAw0/zyxm6mK7jvmB2mepTR29
         rv3IS30lXbpNUrpZzj6E+1yLPDI0hVO1rw0OBgaw+nU4JNNB89Gle6qSxjZdkrn5BE5J
         ex42k7LY0M7vqSSxFhngViuQ9AqhnF3aiBJGuJgPI0YBfQD/AACxGgbGv74PxR6sWPWF
         GtXQ==
X-Gm-Message-State: AOAM5305NZM74QySDn+JWGgolfAcECTeZUeNzkpGtjSFkA/ZWxRRcPaj
	K3qa3gmpby+n7ErKzF6p2c55mipG3To=
X-Google-Smtp-Source: ABdhPJxb4Xj2n1efSP3h7h+Knn15MiWhKjrd/Z36ny8J4ku7beCd5UjiJ/LM6b0XwKqJT1xxrDx9Rg==
X-Received: by 2002:a17:902:26f:: with SMTP id 102mr8993007plc.209.1590070988727;
        Thu, 21 May 2020 07:23:08 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id 5sm4556081pjf.19.2020.05.21.07.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 07:23:08 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 2/3] optee-client: Add sysVinit service
Date: Thu, 21 May 2020 09:22:58 -0500
Message-Id: <20200521142259.15363-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521142259.15363-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200521142259.15363-1-JPEWhacker@gmail.com>

Adds a sysVinit service to start tee-supplicant so that the optee-client
package can be used on distros where systemd is not used. Also does some
cleanup of the recipe including:
 1) Using @path@ tokens for replacemane in the .service file instead of
    paths
 2) Replacing tokens in the .service file after it is installed instead
    of editing the source file in ${WORKDIR}

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../optee/optee-client/tee-supplicant.service |  4 +-
 .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
 .../optee/optee-client_git.bb                 | 24 +++++++---
 3 files changed, 65 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh

diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
index ffb54d3..c273832 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
@@ -3,8 +3,8 @@ Description=TEE Supplicant
 
 [Service]
 User=root
-EnvironmentFile=-/etc/default/tee-supplicant
-ExecStart=/usr/sbin/tee-supplicant $OPTARGS
+EnvironmentFile=-@sysconfdir@/default/tee-supplicant
+ExecStart=@sbindir@/tee-supplicant $OPTARGS
 
 [Install]
 WantedBy=basic.target
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
new file mode 100644
index 0000000..b4d2195
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
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
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
index 64d7d57..5dbbfe9 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -9,19 +9,18 @@ PV = "3.8.0+git${SRCPV}"
 
 require optee.inc
 
-inherit python3native systemd
+inherit python3native systemd update-rc.d
 
 SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git \
     file://tee-supplicant.service \
+    file://tee-supplicant.sh \
 "
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
-
 EXTRA_OEMAKE = "O=${B}"
 
 do_compile() {
@@ -43,9 +42,20 @@ do_install() {
     install -d ${D}${includedir}
     install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
 
-    sed -i -e s:/etc:${sysconfdir}:g \
-           -e s:/usr/bin:${bindir}:g \
-              ${WORKDIR}/tee-supplicant.service
-
     install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
+
+    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+
+    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+           -e s:@sbindir@:${sbindir}:g \
+              ${D}${systemd_system_unitdir}/tee-supplicant.service \
+              ${D}${sysconfdir}/init.d/tee-supplicant
 }
+
+SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
+
+INITSCRIPT_PACKAGES = "${PN}"
+
+INITSCRIPT_NAME_${PN} = "tee-supplicant"
+INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
-- 
2.17.1

