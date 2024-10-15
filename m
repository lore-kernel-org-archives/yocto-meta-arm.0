Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD96D216A3
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:22:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.13431.1728998564134128196
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 06:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AxqcxeXH;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e690479cso3116540e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728998562; x=1729603362; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U35PAUdHFNSBSRgPccfWSV829w+4smbRzwgZQJKmW7Q=;
        b=AxqcxeXH1SxZvHt14N9j+9wn2nbTpSctG7dXgvTi1dObK2xIVnOlgakp0oFrlPUECA
         7RJh04LjJCdUpqUd35LIMsGKsws36sBNV7SHOGNFFFjWpTPQSFgjCUB/JZMxHidA84Fz
         XaNiWvVJrc9aSC/DSOCYIho9djxsAJsTqEoumfe/PEGlpR828k8vN///Y4FuwgZKr/Xs
         8Twpv7AvFizCFL71wlL3fwd/HxPEdceBxC2M6WVXwXL+o+PKZHuKYaOeZ9UCt63Pk8hr
         2klyRQ9Yd5ajsey92PVkFtpLxTVK4IWoRm9uz9cEip4fxGerZG5IPLs5EqWys6cg/Hrs
         4XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998562; x=1729603362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U35PAUdHFNSBSRgPccfWSV829w+4smbRzwgZQJKmW7Q=;
        b=SC5Sne5k0l3ZTpR3ppTHEbizT/edGVVxthLDHxDG8lsRw90fq4LIV447YZuvAOxm5W
         bCn2wsqev52KGZwtBT6a3FWpMRkloFOrzJblVNulSS1P9Aq3++PWfZXIHzfaqxb5fKuy
         PS+Rn7wgn2EtVVAgQEbhxOEP9ydCC9BxKt4bLUci8Vh3GfDuQt9t7YBGvBlAPutiltNd
         ooUm67Uhq2GixmuuWi0YLrezyeIe3zd2k8XK9z1io11UfEWmvxW7W6y3XzAH51C8HnIt
         pjNW7sMdSXYvh8FtWegzRy0b6m4enJ54IpVmHnunWkCCJmjLRp2KiQ1EliqFjI5HON/e
         UWyg==
X-Gm-Message-State: AOJu0Yw0dlnDN4nvVUDq/rKwJEKzcZrnCfyqExu3+wq2p3i4cdAwB7jG
	N8dWspYlo8+SgQUrDlRxazp2xpJhhs62iQxykbB2Ayr22jU8fGbXRr8xn0E3RpeZEYDTl4LRYwN
	ypMk=
X-Google-Smtp-Source: AGHT+IHocSr4ffi4cqt50E1IhgauVpOBIqkYxXSNdo65H8IBi1XVaW2M0Lp6BfV+KNtst66VwXWDPg==
X-Received: by 2002:a05:6512:31d2:b0:537:a855:7d6f with SMTP id 2adb3069b0e04-539e5518b62mr5237518e87.34.1728998561736;
        Tue, 15 Oct 2024 06:22:41 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00005ef4sm167455e87.183.2024.10.15.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:22:41 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	tom.hochstein@nxp.com,
	sahil.malhotra@nxp.com
Subject: [PATCH] optee-client: use udev rule and systemd service from upstream
Date: Tue, 15 Oct 2024 16:22:21 +0300
Message-ID: <20241015132221.95441-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 13:22:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6191

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
 .../recipes-security/optee/optee-client.inc   | 30 +++++++++++--------
 .../optee/optee-client/optee-udev.rules       |  6 ----
 .../optee-client/tee-supplicant@.service      | 13 --------
 .../optee/optee-client_4.3.0.bb               |  2 ++
 4 files changed, 19 insertions(+), 32 deletions(-)
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


