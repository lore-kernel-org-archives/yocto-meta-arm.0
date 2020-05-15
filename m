Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.16591.1589558569924680116
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 May 2020 09:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pebe5Yhr;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id w18so3003982ilm.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 May 2020 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UtLuWA2vQfq1aXispyS0ue8KHX9I/gqte1Gt920J0co=;
        b=Pebe5YhrFLsW+ole2xKzKR5I1zvgdwQ4HmMBC5xmS9M68B89zT5ahhPwbN3xQzUK5J
         inxifWFJJG/Z4+j58y8RkTwTg0m4ygGdLNEie0g9L8PwZJq08WFSwVsHqVDh8VlinWCM
         oA0oklkctRLCQSLRxTGhw3/Z+bPlOpCRFl5K6XfJiO1V3AF92Mi9q30cumHh2HakSs3t
         EjqfFkP3UyoZUwQssuo9ElHfkQdeJNynPHWIONJHGXTTeQk6GstQ41PCXfOevrN3Xxcg
         14dsaTttWGtzQeBQywklpQxjlQOqXmU4Bs/+mc0ToPQjVao/WhkxYcYpAMS6HjGPfLC4
         PKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UtLuWA2vQfq1aXispyS0ue8KHX9I/gqte1Gt920J0co=;
        b=DbXKsKKCUz0PmCNhdpc2hKwfLymdDvvT1FN9QFaKg3cFgzEvOe5GMKtDxaEGO/wR/Z
         3YZosHT6R2va+g5ZYP6txqPm0vPvFmel1QOFsPBnfJHUUVYPvT31uurs94DqPP6qY2el
         CV58F2ukCSiJw7klTwYtqBUf6vD7oe7Tue1gWAGdFjY5zkDwnFdz3iyH/tHxx4VIGC5Y
         0ClXmqTeYfqls1Nl4T/UNH/B7U7fCTYaOlEbefAOHiE+NDowdVTO7Dxa/vQkoV87RHxu
         DuFg1kahAev81zf7sWdLRxeCgh16WH8MNuZCe1LaB6XXzB1pI3YUDNx0Az6Q/pCjjCOH
         kP/g==
X-Gm-Message-State: AOAM532h1eQ4LmG7GSYvw19SczNJYYh1bx2UN0Bhew8ZUYmddjBrfR6n
	tpnMar3poLK3S7rNWS+oXSFpR8xZ2s0=
X-Google-Smtp-Source: ABdhPJwP2//Dm1N1gLZdGoqlNZ+LmohzWkY1YqUpzVraZWGh5t8JehsvtPyuGckfRgdmJCOI2sApQA==
X-Received: by 2002:a92:c704:: with SMTP id a4mr2690620ilp.163.1589558568669;
        Fri, 15 May 2020 09:02:48 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:7472:a058:3fd7:24e9])
        by smtp.gmail.com with ESMTPSA id c10sm878132ioc.24.2020.05.15.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:02:47 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
Date: Fri, 15 May 2020 11:02:39 -0500
Message-Id: <20200515160240.16395-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515160240.16395-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>

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
index ec0826c..a26a799 100644
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
@@ -42,9 +41,20 @@ do_install() {
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

