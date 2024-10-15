Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099E9D216A6
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:35:26 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.13799.1728999325287734740
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 06:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TvQYqrWU;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2284657e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728999323; x=1729604123; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pg3/9qqjoKtuhu2jtp4xcxvdInOTT+zQiuxb+o0K6c=;
        b=TvQYqrWUJTtH+EB1zmz4CezXqaKJLJLoMsE5XT8Jjt8cJyjD7FEtZtUBWb7OMbhBrz
         ermkFvpU1zlK2tB58DfgIyfP/Yi1n1hodadliHsJ1EIeoFTcSrOTsFEEpkjZj1mh7Jy6
         jl7OWPdU7aLC9vqwYWpVAsjnbCpIKKVv4TwA4DrVEPOaYiy2WfJQA+4QrqhbICCZtaGq
         FVXH/6dleF4uWs+x6IRzF8EbUAq6a5jjOZkB7fM8GMzmtDU89E4UZUgXUNBR5i0JuGon
         Z59QIdlwK7DX7ITe7pxZ6gQU5U3s/sj4Ap8Vu7sqOGPih/TG47hGgP5sisgcaORG0eog
         vl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728999323; x=1729604123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pg3/9qqjoKtuhu2jtp4xcxvdInOTT+zQiuxb+o0K6c=;
        b=uFlFdYW51y+uz0y7iqdkntVmWtAZwul1XJquz/DS4hwvdX9YmVlLRM0gTHiXbAHhmz
         4eYS6LXX75mkOAhbw6TkhngOwp7GFvrBfLAWURNHsKFVKjWg4QkMyGQNXzMJ0gCc7Dxn
         ZLiXHvi4PiJqaVXWlNOCqxzqM/IvyORtaccmWH+VN20soq9lNH9Kr9KkbSbq33++Jw1Q
         gR/PbYgeSiqbCldUZksbOqvCanP3yg1+xiC3NQq4jKxa2nf4+fczrjg+r7guXsSjfonl
         nMkSA3UzSR3Hti2VIk37AvgtVuKyH9kOSV4pKiw27/4xL9+CMsoHjaIcdpsYs73ca2qp
         kD1Q==
X-Gm-Message-State: AOJu0YzPH6OAQ0qpgVJ4seumskbmIAxhB/XOMGRm29TH+9L9xm0yEgow
	FiAdrLyYSaCSKHiVKm1BDwIdxzKWirR3VSs36QxDNDegWCIM5VYdg76VTwg/8J3jzMt0mE5Q8kI
	oVXs=
X-Google-Smtp-Source: AGHT+IFOA1Z0r7v8Y6+HdcKhtaSA3+gycMeS70jea29ETL9tlr7AzIJtGLTxIT8QCBNHP9Mo3cxqyQ==
X-Received: by 2002:a05:6512:32c6:b0:539:9490:7257 with SMTP id 2adb3069b0e04-539da4e2641mr7847685e87.30.1728999323060;
        Tue, 15 Oct 2024 06:35:23 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0000cab0sm171147e87.238.2024.10.15.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:35:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	tom.hochstein@nxp.com,
	sahil.malhotra@nxp.com
Subject: [PATCH v2] optee-client: use udev rule and systemd service from upstream
Date: Tue, 15 Oct 2024 16:35:12 +0300
Message-ID: <20241015133512.96327-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 13:35:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6192

Use backported upstream patch for udev rule and systemd service file.
sysvinit script is still used from meta-arm. Don't install systemd
service without systemd distro feature, other way round for
sysvinit script.

tee-supplicant started by systemd service runs as non-root teesuppl
user with teepriv group. sysvinit still runs as root since busybox
start-stop-daemon doesn't support -g group parameter and -u teesuppl
doesn't seem to change the effective user.

udev rules allow non-root /dev/tee* access from tee and
/dev/teepriv* access from teepriv groups.

Tested sysvinit changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml

and systemd changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml:ci/uefi-secureboot.yml

Cc: tom.hochstein@nxp.com
Cc: sahil.malhotra@nxp.com
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-security/optee/optee-client.inc   |  30 +--
 ...dd-udev-rule-and-systemd-service-fil.patch | 186 ++++++++++++++++++
 .../optee/optee-client/optee-udev.rules       |   6 -
 .../optee-client/tee-supplicant@.service      |  13 --
 .../optee/optee-client_4.3.0.bb               |   2 +
 5 files changed, 205 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index f387c805..fc48c302 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -9,9 +9,7 @@ inherit systemd update-rc.d cmake useradd
 
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
-    file://tee-supplicant@.service \
     file://tee-supplicant.sh \
-    file://optee-udev.rules \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
@@ -20,20 +18,21 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
-    -DCFG_TEE_FS_PARENT_PATH='${localstatedir}/lib/tee' \
 "
 EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
 do_install:append() {
-    install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
-    install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
-    install -d ${D}${sysconfdir}/udev/rules.d
-    install -m 0644 ${UNPACKDIR}/optee-udev.rules ${D}${sysconfdir}/udev/rules.d/optee.rules
-
-    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-           -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant@.service \
-              ${D}${sysconfdir}/init.d/tee-supplicant
+    # installed by default
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        rm -rf ${D}${libdir}/systemd
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+        sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+               -e s:@sbindir@:${sbindir}:g \
+                  ${D}${sysconfdir}/init.d/tee-supplicant
+    fi
+    install -o teesuppl -g teesuppl -m 0700 -d ${D}${localstatedir}/lib/tee
 }
 
 SYSTEMD_SERVICE:${PN} = "tee-supplicant@.service"
@@ -42,5 +41,10 @@ INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
 
+# Users and groups:
+# tee group to access /dev/tee*
+# teepriv group to acess /dev/teepriv*, only tee-supplicant
+# teesuppl user and group teesuppl to run tee-supplicant
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system teeclnt"
+GROUPADD_PARAM:${PN} = "--system tee; --system teepriv; --system teesuppl"
+USERADD_PARAM:${PN} = "--system -g teesuppl --groups teepriv --home-dir ${localstatedir}/lib/tee -M --shell /sbin/nologin teesuppl;"
diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch
new file mode 100644
index 00000000..18c0d950
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch
@@ -0,0 +1,186 @@
+From bf0d02758696ee7a9f7af9e95f85f5c238d0e109 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Wed, 2 Oct 2024 15:24:21 +0100
+Subject: [PATCH] tee-supplicant: add udev rule and systemd service file
+
+tee-supplicant startup with systemd init based
+is non-trivial. Add sample udev rule and systemd
+service files here so that distros can co-operate maintaining
+them.
+
+Files are from meta-arm https://git.yoctoproject.org/meta-arm
+at commit 7cce43e632daa8650f683ac726f9124681b302a4 with license
+MIT and authors:
+
+Peter Griffin <peter.griffin@linaro.org>
+Joshua Watt <JPEWhacker@gmail.com>
+Javier Tia <javier.tia@linaro.org>
+Mikko Rapeli <mikko.rapeli@linaro.org>
+
+With permission from the authors, files can be relicensed to
+BSD-2-Clause like rest of optee client repo.
+
+The config files expect to find tee and teepriv system groups
+and teesuppl user and group (part of teepriv group) for running
+tee-supplicant. Additionally state directory /var/lib/tee
+must be owned by teesuppl user and group with no rights
+to other users. The groups and user can be changed via
+CMake variables:
+
+CFG_TEE_GROUP
+CFG_TEEPRIV_GROUP
+CFG_TEE_SUPPL_USER
+CFG_TEE_SUPPL_GROUP
+
+Change storage path from /data to /var/lib and
+use standard CMake variables also for constructing install
+paths which can be override to change the defaults:
+
+CMAKE_INSTALL_PREFIX, e.g. /
+CMAKE_INSTALL_LIBDIR, e.g. /usr/lib
+CMAKE_INSTALL_LOCALSTATEDIR /var
+
+Once these are setup, udev will start tee-supplicant in initramfs
+or rootfs with teesuppl user and group when /dev/teepriv
+device appears. The systemd service starts before tpm2.target
+(new in systemd 256) which starts early in initramfs and in main rootfs.
+This covers firmware TPM TA usecases for main rootfs encryption. When
+stopping tee-supplicant, the ftpm kernel modules are removed and only
+then the main process stopped to avoid fTPM breakage. These workarounds
+may be removed once RPMB kernel and optee patches without tee-supplicant
+are merged (Linux kernel >= 6.12-rc1, optee_os latest master or >= 4.4).
+
+Tested on yocto meta-arm setup which runs fTPM and optee-test/xtest
+under qemuarm64:
+
+$ git clone https://git.yoctoproject.org/meta-arm
+$ cd meta-arm
+$ SSTATE_DIR=$HOME/sstate DL_DIR=$HOME/download kas build \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+
+Compiled image can be manually started to qemu serial console with:
+
+$ SSTATE_DIR=$HOME/sstate DL_DIR=$HOME/download kas shell \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+$ runqemu slirp nographic
+
+meta-arm maintainers run these tests as part of their CI.
+
+Note that if the tee-supplicant state directory /var/lib/tee
+can not be accessed due permissions or other problems, then
+tee-supplicant startup with systemd still works. Only optee-test/xtest
+will be failing and fTPM kernel drivers fail to load with error
+messages.
+
+Cc: Peter Griffin <peter.griffin@linaro.org>
+Cc: Joshua Watt <JPEWhacker@gmail.com>
+Cc: Javier Tia <javier.tia@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ config.mk                                 |  2 +-
+ libteec/CMakeLists.txt                    |  2 +-
+ tee-supplicant/CMakeLists.txt             | 13 +++++++++++--
+ tee-supplicant/optee-udev.rules.in        |  7 +++++++
+ tee-supplicant/tee-supplicant@.service.in | 17 +++++++++++++++++
+ 5 files changed, 37 insertions(+), 4 deletions(-)
+ create mode 100644 tee-supplicant/optee-udev.rules.in
+ create mode 100644 tee-supplicant/tee-supplicant@.service.in
+
+Upstream-Status: Backport
+
+diff --git a/config.mk b/config.mk
+index eae481f..3def087 100644
+--- a/config.mk
++++ b/config.mk
+@@ -23,7 +23,7 @@ CFG_TEE_SUPP_LOG_LEVEL?=1
+ #   This folder can be created with the required permission in an init
+ #   script during boot, else it will be created by the tee-supplicant on
+ #   first REE FS access.
+-CFG_TEE_FS_PARENT_PATH ?= /data/tee
++CFG_TEE_FS_PARENT_PATH ?= /var/lib/tee
+ 
+ # CFG_TEE_CLIENT_LOG_FILE
+ #   The location of the client log file when logging to file is enabled.
+diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
+index c742d31..c857369 100644
+--- a/libteec/CMakeLists.txt
++++ b/libteec/CMakeLists.txt
+@@ -14,7 +14,7 @@ endif()
+ # Configuration flags always included
+ ################################################################################
+ set(CFG_TEE_CLIENT_LOG_LEVEL "1" CACHE STRING "libteec log level")
+-set(CFG_TEE_CLIENT_LOG_FILE "/data/tee/teec.log" CACHE STRING "Location of libteec log")
++set(CFG_TEE_CLIENT_LOG_FILE "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee/teec.log" CACHE STRING "Location of libteec log")
+ 
+ ################################################################################
+ # Source files
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
+index 54a34c7..8df9bef 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -11,10 +11,15 @@ option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant plugin support" ON)
+ set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
+ # FIXME: Question is, is this really needed? Should just use defaults from # GNUInstallDirs?
+ set(CFG_TEE_CLIENT_LOAD_PATH "/lib" CACHE STRING "Colon-separated list of paths where to look for TAs (see also --ta-dir)")
+-set(CFG_TEE_FS_PARENT_PATH "/data/tee" CACHE STRING "Location of TEE filesystem (secure storage)")
++set(CFG_TEE_FS_PARENT_PATH "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee" CACHE STRING "Location of TEE filesystem (secure storage)")
+ # FIXME: Why do we have if defined(CFG_GP_SOCKETS) && CFG_GP_SOCKETS == 1 in the c-file?
+ set(CFG_GP_SOCKETS "1" CACHE STRING "Enable GlobalPlatform Socket API support")
+-set(CFG_TEE_PLUGIN_LOAD_PATH "/usr/lib/tee-supplicant/plugins/" CACHE STRING "tee-supplicant's plugins path")
++set(CFG_TEE_PLUGIN_LOAD_PATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/${PROJECT_NAME}/plugins/" CACHE STRING "tee-supplicant's plugins path")
++
++set(CFG_TEE_GROUP "tee" CACHE STRING "Group which has access to /dev/tee* devices")
++set(CFG_TEEPRIV_GROUP "teepriv" CACHE STRING "Group which has access to /dev/teepriv* devices")
++set(CFG_TEE_SUPPL_USER "teesuppl" CACHE STRING "User account which tee-supplicant is started with")
++set(CFG_TEE_SUPPL_GROUP "teesuppl" CACHE STRING "Group account which tee-supplicant is started with")
+ 
+ if(CFG_TEE_SUPP_PLUGINS)
+ 	set(CMAKE_INSTALL_RPATH "${CFG_TEE_PLUGIN_LOAD_PATH}")
+@@ -113,3 +118,7 @@ endif()
+ # Install targets
+ ################################################################################
+ install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR})
++configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.service DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
++configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
+diff --git a/tee-supplicant/optee-udev.rules.in b/tee-supplicant/optee-udev.rules.in
+new file mode 100644
+index 0000000..275e833
+--- /dev/null
++++ b/tee-supplicant/optee-udev.rules.in
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: BSD-2-Clause
++KERNEL=="tee[0-9]*", MODE="0660", OWNER="root", GROUP="@CFG_TEE_GROUP@", TAG+="systemd"
++
++# If a /dev/teepriv[0-9]* device is detected, start an instance of
++# tee-supplicant.service with the device name as parameter
++KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="@CFG_TEEPRIV_GROUP@", \
++    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
+diff --git a/tee-supplicant/tee-supplicant@.service.in b/tee-supplicant/tee-supplicant@.service.in
+new file mode 100644
+index 0000000..e53a935
+--- /dev/null
++++ b/tee-supplicant/tee-supplicant@.service.in
+@@ -0,0 +1,17 @@
++# SPDX-License-Identifier: BSD-2-Clause
++[Unit]
++Description=TEE Supplicant on %i
++DefaultDependencies=no
++After=dev-%i.device
++Wants=dev-%i.device
++Conflicts=shutdown.target
++Before=tpm2.target sysinit.target shutdown.target
++
++[Service]
++Type=notify
++User=@CFG_TEE_SUPPL_USER@
++Group=@CFG_TEE_SUPPL_GROUP@
++EnvironmentFile=-@CMAKE_INSTALL_SYSCONFDIR@/default/tee-supplicant
++ExecStart=@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_SBINDIR@/tee-supplicant $OPTARGS
++# Workaround for fTPM TA: stop kernel module before tee-supplicant
++ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
deleted file mode 100644
index 075f469c..00000000
--- a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
+++ /dev/null
@@ -1,6 +0,0 @@
-KERNEL=="tee[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", TAG+="systemd"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
-    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
deleted file mode 100644
index e3039fde..00000000
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=TEE Supplicant on %i
-DefaultDependencies=no
-After=dev-%i.device
-Wants=dev-%i.device
-Conflicts=shutdown.target
-Before=tpm2.target sysinit.target shutdown.target
-
-[Service]
-Type=notify
-EnvironmentFile=-@sysconfdir@/default/tee-supplicant
-ExecStart=@sbindir@/tee-supplicant $OPTARGS
-ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
index 4a088004..edab4583 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -2,6 +2,8 @@ require recipes-security/optee/optee-client.inc
 
 SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
 
+SRC_URI += "file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch"
+
 inherit pkgconfig
 DEPENDS += "util-linux"
 EXTRA_OEMAKE += "PKG_CONFIG=pkg-config"
-- 
2.34.1


